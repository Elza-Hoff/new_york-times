//
//  APIConstants.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

enum APIConstants {
    static let reachabilityManagerHost = "google.com"
        
    static let apiURL = "https://api.nytimes.com"
    
    static let imageMimeType = "image/jpeg"
    static let imageFileName = "image.jpg"
    static let defaultListBatchSize = 20
    static let defaultUserAgent = "app/ios"
}

enum APIContentType: String {
    case applicationJSON = "application/json"
    case applicationPDF = "application/pdf"
    case applicationFormURLEncoded = "application/x-www-form-urlencoded"
}

enum APIHeaders: String {
    case userAgent      = "User-Agent"
    case contentType    = "Content-Type"
    case authorization  = "Authorization"
}

enum APIParameterName: String {
    case refreshToken
    case accessToken
    case code
    case message
    case success
    case title
    case abstract
    case results
}

enum APIPath {
    
    static let arts         = "/svc/topstories/v2/arts"
    static let automobiles  = "/svc/topstories/v2/automobiles"
    static let books        = "/svc/topstories/v2/books"
    static let business     = "/svc/topstories/v2/business"
    static let fashion      = "/svc/topstories/v2/fashion"
    static let food         = "/svc/topstories/v2/food"
    static let health       = "/svc/topstories/v2/health"
    static let home         = "/svc/topstories/v2/home"
    static let insider      = "/svc/topstories/v2/insider"
    static let magazine     = "/svc/topstories/v2/magazine"
    static let movies       = "/svc/topstories/v2/movies"
    static let nyregion     = "/svc/topstories/v2/nyregion"
    static let obituaries   = "/svc/topstories/v2/obituaries"
    static let opinion      = "/svc/topstories/v2/opinion"
    static let politics     = "/svc/topstories/v2/politics"
    static let realestate   = "/svc/topstories/v2/realestate"
    static let science      = "/svc/topstories/v2/science"
    static let sports       = "/svc/topstories/v2/sports"
    static let sundayreview = "/svc/topstories/v2/sundayreview"
    static let technology   = "/svc/topstories/v2/technology"
    static let theater      = "/svc/topstories/v2/theater"
    static let travel       = "/svc/topstories/v2/travel"
    static let upshot       = "/svc/topstories/v2/upshot"
    static let us           = "/svc/topstories/v2/us"
    static let world        = "/svc/topstories/v2/world"
    
}

enum RequestType {
    case arts
    case automobiles
    case books
    case business
    case fashion
    case food
    case health
    case home
    case insider
    case magazine
    case movies
    case nyregion
    case obituaries
    case opinion
    case politics
    case realestate
    case science
    case sports
    case sundayreview
    case technology
    case theater
    case travel
    case upshot
    case us
    case world
    
    //all
    
    case allRequests
}
