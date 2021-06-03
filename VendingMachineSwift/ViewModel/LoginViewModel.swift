//
//  LoginViewModel.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/01.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var isDismiss: Bool = false
    var isLogin: Bool = false
    
    func dismissLoginView(isDismiss: Bool){
        self.isDismiss = isDismiss
    }
    
    func updateIsLogin() {
        self.isLogin = true
    }
    
}
