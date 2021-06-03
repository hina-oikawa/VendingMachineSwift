//
//  HomeViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/02.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var presentFlg: Bool = false

    func fetch() {
        self.title = "Home View"
    }
    
    func presentLoginView(presentFlg: Bool) {
        self.presentFlg = presentFlg
    }
    
}
