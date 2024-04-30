//
//  details.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI

struct details: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.modelContext) var context
    @State var product: Product

    var body: some View {
        Form {
            if editMode?.wrappedValue.isEditing == true {
                HStack {
                    Text("Product Name")
                    Spacer(minLength: 30)
                    TextField("Product Name", text: $product.productName, prompt: Text("Required"))
                        .frame(width: 120)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 30)
                        .multilineTextAlignment(.center)
                }

                HStack {
                    Text("Product Code")
                    Spacer()
                    TextField("Code", text: $product.productCode, prompt: Text("Required"))
                        .frame(width: 120)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 30)
                        .multilineTextAlignment(.center)

                }
                HStack {
                    Text("Quantity")
                    Spacer()
                    TextField("Quantity", text: $product.quantity, prompt: Text("Required"))
                        .keyboardType(.numberPad)
                        .frame(width: 120)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 30)
                        .multilineTextAlignment(.center)
                }

            } else {
                HStack {
                    Text("Product Name")
                    Spacer()
                    Text(product.productName)
                        .padding(.trailing, 30)
                }

                HStack {
                    Text("Product Code")
                    Spacer()
                    Text(product.productCode)
                        .padding(.trailing, 30)
                }

                HStack {
                    Text("Quantity")
                    Spacer()
                    Text(product.quantity)
                        .padding(.trailing, 30)
                }
            }
        }
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar {
            EditButton()
        }
        .navigationTitle(Text("Detail").font(.title))
    }
}

#Preview {
    details(product: Product(productName: "", productCode: "", quantity: "1", orderIndex: 0))
}
