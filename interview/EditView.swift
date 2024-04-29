//
//  EditView.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData

struct EditView: View {

    @State private var productName: String = ""
    @State private var productCode: String = ""
    @State private var quantity = ""
    @State private var isPrinted = "false"
    @State private var orderIndex = ""
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {

            TextField("Enter your product name", text: $productName)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            Divider()
                .padding(.horizontal, 20)

            TextField("Enter your productCode", text: $productCode)
                .padding(.top, 20)
                .padding(.horizontal, 20)


            Divider()
                .padding(.horizontal, 20)

            TextField("Enter your quantity", text: $quantity)
                .keyboardType(.numberPad)
                .padding(.top, 20)
                .padding(.horizontal, 20)

            Divider()
                .padding(.horizontal, 20)

//            TextField("Enter your ordertIndex", text: $orderIndex)
//                .keyboardType(.numberPad)
//                .padding(.top, 20)
//                .padding(.horizontal, 20)
//
//            Divider()
//                .padding(.horizontal, 20)

            Button(action: {
                add(productName: productName, productCode: productCode, quantity: quantity, orderIndex: Int(orderIndex) ?? 0)
                self.presentationMode.wrappedValue.dismiss()

            }){
                Text("Save")
                    .padding()
            }
            .frame(width: 340)
            .foregroundColor(.white)
            .background(.pink)
            .cornerRadius(10)
            .padding(.top, 20)
        }
        Spacer()

    }

    func add(productName: String, productCode: String, quantity: String, orderIndex: Int) {
        context.insert(Product(productName: productName, productCode: productCode, quantity: quantity, orderIndex: orderIndex))
    }

    func DeleteButton(productName: String, productCode: String, quantity: String, isPrinted: String, orderIndex: Int) {
        context.delete(Product(productName: productName, productCode: productCode, quantity: quantity, orderIndex: orderIndex))
    }
}


#Preview {
    EditView()
}
