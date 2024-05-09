//
//  RestError.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

enum RESTError {
    case failedToCreateURL
    case failedToDecodeResponse
    case failedToFinishRequest
}

// MARK: - Error description extension

extension RESTError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedToCreateURL:
            return "Error while URL creation"
        case .failedToDecodeResponse:
            return "Error while decoding response data"
        case .failedToFinishRequest:
            return "Error while tasking current request"
        }
    }
}
