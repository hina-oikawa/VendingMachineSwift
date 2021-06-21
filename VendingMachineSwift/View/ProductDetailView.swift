//
//  ProductDetailView.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/15.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    let strings = Strings.ProductDetail()
    @State var paymentText: String = ""
    @State var productCountText: String = ""
    @State var totalPrice: Int = 0
    @State var totalSum: Int = 0
    
    var body: some View {
        VStack {
            Text(self.viewModel.productName)
            Text(self.strings.productDescription)
            Text(self.strings.price + self.strings.unit)
            
            Image(self.viewModel.productName)
                .resizable()
                .frame(width: 150.0, height: 150.0)
                .cornerRadius(10)
                .clipShape(Rectangle())
            
            TextField(self.strings.countTextFieldPlaceholder, text: self.$productCountText)
                .autocapitalization(.none)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: self.productCountText, perform: self.totalPriceCalculation)
            
            Text(self.strings.total + self.totalPrice.description + self.strings.unit)
            
            TextField(self.strings.paymentTextFieldPlaceholder, text: self.$paymentText)
                .autocapitalization(.none)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: self.paymentText, perform: self.totalPaymentCalculation)
            
            Text(self.strings.fishing + self.totalSum.description + self.strings.unit)
            
            Button(action: {
                guard let payment = Int(self.paymentText) else { return }
                if self.totalPrice == payment || self.totalSum > 0 {
                    self.viewModel.dismissProductDetailView(isDismiss: true)
                }
                
            }, label: {
                Text(self.strings.settlementButton)
            })
            
        }
    }
    func totalPriceCalculation(value: String) {
        if let price = Int(self.strings.price), let count = Int(productCountText) {
            self.totalPrice = price * count
        }
    }
    
    func totalPaymentCalculation(value: String) {
        if let payment = Int(self.paymentText) {
            self.totalSum = payment - self.totalPrice
        }
    }
}
