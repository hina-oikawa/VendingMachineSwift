//
//  LoginViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/01.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var title: String = ""

    func fetch() {
        self.title = "Login View"
    }
    
}
