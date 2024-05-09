//
//  Timestamp.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

class Timestamp {
    static func generateTimestamp() -> String {
        let date = Date()
        let timeInterval = date.timeIntervalSince1970
        return String(timeInterval)
    }
}
