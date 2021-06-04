//
//  ProductViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/04.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var presentFlg: Bool = false
    
    func presentProductView(presentFlg: Bool) {
        self.presentFlg = presentFlg
    }
    
}
