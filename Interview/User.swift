//
//  User.swift
//  Interview
//
//  Created by Daniel Pietsch on 4/17/25.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
}

