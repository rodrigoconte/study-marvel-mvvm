//
//  RESTService.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

class RESTService<T: RESTRequest> {
    
    private let decoder = JSONDecoder()
    
    func request<U: Decodable>(_ request: T) async throws -> U {
        guard let url = createURL(with: request) else {
            throw RESTError.failedToCreateURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RESTError.failedToFinishRequest
        }
        
        do {
            return try decoder.decode(U.self, from: data)
        } catch {
            throw RESTError.failedToDecodeResponse
        }
    }
    
    // MARK: Private methods
    
    private func createURL(with request: T) -> URL? {
        var urlComponents = URLComponents(string: request.baseURL)
        urlComponents?.path = request.path
        urlComponents?.queryItems = request.queryItems
        
        return urlComponents?.url
    }

}
