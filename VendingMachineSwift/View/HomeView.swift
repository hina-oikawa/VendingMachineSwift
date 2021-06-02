//
//  HomeView.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/02.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text(self.viewModel.title)
        Button("Present Login") {
            self.viewModel.presentLogin(loginTitle: "Login View")
        }
    }
}
