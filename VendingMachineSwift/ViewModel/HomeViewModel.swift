//
//  HomeViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/02.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var presentLogin: String?

    func fetch() {
        self.title = "Home View"
    }
    
    func presentLogin(loginTitle: String) {
        self.presentLogin = loginTitle
    }
    
}
