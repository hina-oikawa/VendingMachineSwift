//
//  LoginView.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/01.
//

import SwiftUI
import Foundation

struct LoginView: View {
    let strings = Strings.Login()
    @ObservedObject var viewModel: LoginViewModel
    @State var idText: String = ""
    @State var passText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingHomeView: Bool = false
    
    var body: some View {
        Text(self.viewModel.title)
        VStack{
            TextField(self.strings.idTextFieldPlaceholder, text: $idText)
                .autocapitalization(.none)
                .keyboardType(.asciiCapable)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: idText, perform: idTextFilter)
            
            TextField(self.strings.passTextFieldPlaceholder, text: self.$passText)
                .autocapitalization(.none)
                .keyboardType(.asciiCapable)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: passText, perform: passTextFilter)
            
            Button(self.strings.buttonTitle, action: {
                showingHomeView(idText: self.idText, passText: self.passText)
            })
        }
    }
    func idTextFilter(value: String) {
        let sets = CharacterSet(charactersIn: self.strings.validCodes)
        idText = String(value.unicodeScalars.filter(sets.contains).map(Character.init))
    }
    
    func passTextFilter(value: String) {
        let sets = CharacterSet(charactersIn: self.strings.validCodes)
        passText = String(value.unicodeScalars.filter(sets.contains).map(Character.init))
    }
    
    // TODO: ログイン画面を閉じる処理に修正する
    func showingHomeView(idText: String, passText: String) {
        if idText == "" || passText == "" {
            print("ログイン失敗")
        } else {
            self.viewModel.dismissLoginView(isDismiss: true)
        }
        
    }
}
