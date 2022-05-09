//
//  Order.swift
//  Order
//
//  Created by thond02 on 09/05/2022.
//

import Foundation


struct Dishes: Codable {
    var id, name, detail: String
    var media: [String]
    var cost: Int
    var isDelivered: Bool
}

enum OrderState {
    case new
    case processing
    case delivered
    case paid
    case cancelled
}
struct Order {
    var id: Int
    var state: OrderState = .new
    var dishes: [Dishes] = []
    var tables: [Int] = []
}

extension Order {
    var cost: Int {
        dishes.reduce(0) { partialResult, next in
            partialResult + next.cost
        }
    }
}
