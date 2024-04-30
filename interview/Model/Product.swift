//
//  Product.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class Product: Identifiable {
    var id: String
    var productName: String
    var productCode: String
    var isPrinted: Bool
    var quantity: String
    var orderIndex: Int  // used reordering the list

    init(productName: String, productCode: String, quantity: String , orderIndex: Int) {
        self.id = UUID().uuidString
        self.productName = productName
        self.productCode = productCode
        self.isPrinted = false
        self.quantity = quantity
        self.orderIndex = orderIndex
    }
}


