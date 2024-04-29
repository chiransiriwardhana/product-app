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
    var quantity: String
    var isPrinted: Bool
    var orderIndex: Int

    init(productName: String, productCode: String, quantity: String, orderIndex: Int ) {
        self.id = UUID().uuidString
        self.productName = productName
        self.productCode = productCode
        self.quantity = quantity
        self.isPrinted = false
        self.orderIndex = orderIndex

    }
}


