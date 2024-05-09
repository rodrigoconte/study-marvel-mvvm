//
//  HeroesAPI.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

enum HeroesAPI {
    case getHeroes
}

extension HeroesAPI: RESTRequest {
    var baseURL: String {
        return "https://gateway.marvel.com"
    }
    
    var path: String {
        switch self {
        case .getHeroes:
            return "/v1/public/characters"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        let timestamp = Timestamp.generateTimestamp()
        let timestampQueryItem = URLQueryItem(name: "ts", value: timestamp)
        
        let publicKey = "17ce73d21ca996d853d33611bdba2c54"
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: publicKey)
        
        let privateKey = "f88f15a11cb56db01c686c90811ef32b63c71f64"
        let hashString = MD5.generateMD5Hash(from: timestamp + privateKey + publicKey)
        let hashQueryItem = URLQueryItem(name: "hash", value: hashString)
        
        let limit = "80"
        let limitQueryItem = URLQueryItem(name: "limit", value: limit)
        
        let offSet = "0"
        let offSetQueryItem = URLQueryItem(name: "offset", value: offSet)
        
        return [timestampQueryItem, apiKeyQueryItem, hashQueryItem, limitQueryItem, offSetQueryItem]
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getHeroes:
            return .get
        }
    }
    
    
}
