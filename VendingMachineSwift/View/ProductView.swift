//
//  ProductView.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/04.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    @ObservedObject var productDetailViewModel: ProductDetailViewModel
    let productData: ProductData = ProductData()
    let strings = Strings.Product()
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    public var companyName: String
    
    init(viewModel: ProductViewModel, detailViewModel: ProductDetailViewModel, companyName: String) {
        self.viewModel = viewModel
        self.productDetailViewModel = detailViewModel
        self.companyName = companyName
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                if companyName == self.strings.tsumetai {
                    makeProductView(products: self.productData.tsumetais)
                }
                else if companyName == self.strings.tokuho {
                    makeProductView(products: self.productData.tokuhos)
                }
                else if companyName == self.strings.energy {
                    makeProductView(products: self.productData.energys)
                }
                else if companyName == self.strings.cola {
                    makeProductView(products: self.productData.colas)
                }
                else if companyName == self.strings.coffee {
                    makeProductView(products: self.productData.coffees)
                }
                else if companyName == self.strings.attakai {
                    makeProductView(products: self.productData.attakais)
                }
                else if companyName == self.strings.nyuusankin {
                    makeProductView(products: self.productData.nyuusankins)
                }
                else if companyName == self.strings.awamori {
                    makeProductView(products: self.productData.awamoris)
                }
            }
        }
    }
    
    func makeProductView(products: [String]) -> some View {
        ForEach((0...products.count-1), id: \.self) { product in
            Image(products[product % products.count])
                .resizable()
                .frame(width: 150.0, height: 150.0)
                .cornerRadius(10)
                .clipShape(Rectangle())
                .onTapGesture {
                    self.productDetailViewModel.presentProductDetailView(
                        presentFlg: true,
                        productName: products[product]
                    )
                }
        }
    }
}
