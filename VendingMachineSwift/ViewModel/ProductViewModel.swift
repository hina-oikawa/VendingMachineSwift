//
//  ProductViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/04.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var presentFlg: Bool = false
    var companyName: String = ""
    
    func presentProductView(presentFlg: Bool, companyName: String) {
        self.companyName = companyName
        self.presentFlg = presentFlg
    }
    
}
