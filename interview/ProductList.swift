//
//  ProductList.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData


struct ProductsRow: View {
    var product: Product
    @State private var showGreeting = false
    @Environment(\.modelContext) var context
    @State private var isOn = false
    var body: some View {
        NavigationLink(destination: details(product: product)) {
            HStack {
                Image("product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30)

                Text(product.productName).padding(.leading)
                Spacer()
                Toggle(isOn: $isOn) {
                    Text("Print")
                }
                .toggleStyle(.button)
                .onChange(of: isOn) {
                    product.isPrinted.toggle()
                }
            }
        }
    }
    func printItem() {
        if isOn {
            print("Hi")
        }
    }
}

struct ProductList: View {
    @Query(sort: \Product.orderIndex) var items: [Product]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                List {
                    Section {
                        ForEach(items) { pro in
                            ProductsRow(product: pro)
                        }
                        .onMove { source, destination in
                            var updatedItems = items
                            updatedItems.move(fromOffsets: source, toOffset: destination)
                            for (index, item) in updatedItems.enumerated() {
                                item.orderIndex = index
                            }
                        }
                        .onDelete(perform: removeItem)
                    }
                }
                Button("Print", action: {
                    for i in 0...(items.count-1){
                        if items[i].isPrinted {

                            context.delete(items[i])
                        }
                    }
                })
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.pink)
                .cornerRadius(10)
                .padding(.bottom, 100)
            }
            .navigationTitle("Available Products")
            .navigationBarItems(leading: EditButton(), trailing:
                                    NavigationLink(destination: EditView()) {
                Text("Add/Delete")
            })
        }
    }



    private func move(from source: inout IndexSet, to destination:  inout Int) {


        var descriptor = FetchDescriptor<Product>()
        var results =  (try? context.fetch(descriptor)) ?? []

        for ele in results {
            print("results:\(ele.productName)")
        }

        for ele in results {
            context.delete(ele)
        }


        for obj in results {
            self.context.insert(obj)
        }

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    func removeItem(at indexSet: IndexSet) {
        for i in indexSet {
            let product = items[i]
            context.delete(product)
        }
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()

        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}


//#Preview {
//    ProductList()
//}
