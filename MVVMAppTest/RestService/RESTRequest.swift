//
//  RESTRequest.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

protocol RESTRequest {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var httpMethod: HTTPMethod { get }
}
