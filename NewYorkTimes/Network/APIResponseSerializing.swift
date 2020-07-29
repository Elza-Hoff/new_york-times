//
//  APIResponseSerializing.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

private let emptyDataStatusCodes: Set<Int> = [202, 204, 205]

func APIObjectJSONResponseSerializer<T: Unmarshaling>(type: T.Type) -> DataResponseSerializer<T> {
    return APIObjectResponseSerializer(type: type, dataSerializer: { (data) -> JSONObject? in
        do {
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonSingle = jsonObj as? JSONObject {
                return jsonSingle
            } else if let jsonArray = jsonObj as? [JSONObject] {
                return ["data" : jsonArray]
            }
            return nil
        } catch {
            return nil
        }
    })
}

func APIObjectResponseSerializer<T: Unmarshaling>(type: T.Type, dataSerializer: @escaping (Data) -> JSONObject?) -> DataResponseSerializer<T> {
    return DataResponseSerializer { _, response, data, error in
        do {
            if let error = error { throw error }
            
            if let response = response, emptyDataStatusCodes.contains(response.statusCode) {
                return try .success(type.init(object: [:]))
            }
            
            guard let validData = data, validData.count > 0 else {
                throw APIError.invalidResponse
            }
            guard let object = dataSerializer(validData) else {
                throw APIError.invalidResponse
            }
            
            return try .success(type.init(object: object))
        } catch {
            return .failure(error as NSError)
        }
    }
}

// Response serializer to import JSON Array using Marshal and return an array of objects

func APICollectionResponseSerializer<T: Collection>(type: T.Type) -> DataResponseSerializer<T> where T.Iterator.Element: Unmarshaling {
    return DataResponseSerializer { _, _, data, error in
        do {
            if let error = error { throw error }
            
            guard let validData = data, validData.count > 0 else {
                throw APIError.invalidResponse
            }
            let JSON = try JSONSerialization.jsonObject(with: validData, options: [])
            guard let collection = JSON as? [JSONObject] else {
                throw APIError.invalidResponse
            }
            let result = try collection.map({ try T.Iterator.Element.init(object: $0) })
            guard let typedResult = result as? T else {
                // Result is identical to T, but of type [T.Iterator.Element] which Swift can not infer correctly.
                fatalError("Unable to transfer typed arrays")
            }
            return .success(typedResult)
        } catch {
            return .failure(error as NSError)
        }
    }
}
