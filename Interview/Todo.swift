//
//  Todo.swift
//  Interview
//
//  Created by Daniel Pietsch on 4/17/25.
//

struct Todo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
