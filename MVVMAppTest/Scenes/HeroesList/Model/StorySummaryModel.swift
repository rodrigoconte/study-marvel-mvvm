//
//  StorySummaryModel.swift
//  marvelHeroes
//
//  Created by Rodrigo Conte on 31/01/21.
//  Copyright (c) 2021 Rodrigo Conte. All rights reserved.
//

import Foundation

struct StorySummaryModel: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}
