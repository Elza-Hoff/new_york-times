//
//  Alamofire+NetworkClient.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

extension SessionManager {
    
    func request<Endpoint: APIEndpoint>(_ baseURL: URL, endpoint: Endpoint) -> DataRequest {
        guard let url = URL(string: endpoint.path, relativeTo: baseURL) else {
            fatalError("Invalid Path Specification")
        }
        let request = self.request(
            url,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: endpoint.headers
        )
        self.prepareCacheRequest(request, with: endpoint)
        return request
    }
    
    @discardableResult
    func requestJSON<Endpoint: APIEndpoint>(_ baseURL: URL, endpoint: Endpoint, completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest
        where Endpoint.ResponseType: Unmarshaling {
            let handler = APIObjectJSONResponseSerializer(type: Endpoint.ResponseType.self)
            return self.request(baseURL, endpoint: endpoint, handler: handler, completion: completion)
    }
    
    func request<Endpoint: APIEndpoint>(_ baseURL: URL,
                                        endpoint: Endpoint,
                                        handler: DataResponseSerializer<Endpoint.ResponseType>,
                                        completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest
        where Endpoint.ResponseType: Unmarshaling {
            let request = self.request(baseURL, endpoint: endpoint)
            request.validate(APIResponseValidator)
            request.response(responseSerializer: handler) { response in
                var validatedError: APIError?
                if let error = response.result.error {
                    print("response=\(String(describing: response.response))")
                    validatedError = ErrorValidator(error: error)
                }
                self.persistRequest(request, with: response.result.value)
                completion(response.result.value, validatedError)
            }
            return request
    }
    
    func uploadPdfFileRequest<Endpoint: APIEndpoint>(_ baseURL: URL,
                                                     file: Data,
                                                     endpoint: Endpoint,
                                                     completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest
        where Endpoint.ResponseType: Unmarshaling {
            guard let url = URL(string: endpoint.path, relativeTo: baseURL) else {
                fatalError("Invalid Path Specification")
            }

            let request = self.upload(file, to: url, method: endpoint.method, headers: endpoint.headers)
            request.validate(APIResponseValidator)
            let handler = APIObjectJSONResponseSerializer(type: Endpoint.ResponseType.self)
            request.validate(APIResponseValidator)
            request.response(responseSerializer: handler) { response in
                var validatedError: APIError?
                if let error = response.result.error {
                    validatedError = ErrorValidator(error: error)
                }
                completion(response.result.value, validatedError)
            }
            return request
    }
    
    func downloadFileRequest<Endpoint: APIEndpoint>(_ baseURL: URL,
                                                    endpoint: Endpoint,
                                                    completion: @escaping (Data?, Error?) -> Void)  -> DataRequest {
        let request = self.request(baseURL, endpoint: endpoint)
        request.validate(APIResponseValidator)
        request.responseData { response in
            var validatedError: APIError?
            if let error = response.result.error {
                validatedError = ErrorValidator(error: error)
            }
            completion(response.result.value, validatedError)
        }
        return request
    }
    
    @discardableResult
    func request<Endpoint: APIEndpoint>(_ baseURL: URL, endpoint: Endpoint, completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest where Endpoint.ResponseType: Collection, Endpoint.ResponseType.Iterator.Element: Unmarshaling {
        let request = self.request(baseURL, endpoint: endpoint)
        let handler = APICollectionResponseSerializer(type: Endpoint.ResponseType.self)
        request.validate(APIResponseValidator)
        request.response(responseSerializer: handler) { response in
            var validatedError: APIError?
            if let error = response.result.error {
                validatedError = ErrorValidator(error: error)
            }
            completion(response.result.value, validatedError)
        }
        return request
    }
    
}

// MARK: - Persist

extension SessionManager {
    
    func persistRequest(_ request: DataRequest, with response: Any?) {
        guard let response = response as? APICachableResponse else {
            return
        }
//        request.cachedResponse = response.result
    }

    func prepareCacheRequest<Endpoint: APIEndpoint>(_ request: DataRequest, with endpoint: Endpoint) {
        guard let cachableEndpoint = endpoint as? APICachableEndpoint else {
            print("Endpoint doesn't support APICachableEndpoint protocol.")
            return
        }
//        request.cacheTime = cachableEndpoint.cacheTime
    }
    
}
