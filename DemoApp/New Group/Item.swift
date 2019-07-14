//
//  Item.swift
//  DemoApp
//
//  Created by Amelia Płatek on 11/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import Foundation

struct Item: Codable {
    
    let id: Int
    let name: String
    let fullName: String
    let watchersCount: Int
    let forksCount: Int
    let score: Double
}
