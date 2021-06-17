//
//  ProductDetailViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/15.
//

import Foundation
import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var presentFlg: Bool = false
    @Published var isDismiss: Bool = false
    var productName: String = ""
    
    func presentProductDetailView(presentFlg: Bool, productName: String) {
        self.productName = productName
        self.presentFlg = presentFlg
    }
    
    func dismissProductDetailView(isDismiss: Bool){
        self.isDismiss = isDismiss
    }
}
