//
//  Resoult.swift
//  DemoApp
//
//  Created by Amelia Płatek on 11/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import Foundation

struct Resoult: Codable {
    
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
}
