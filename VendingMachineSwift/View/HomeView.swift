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
    let homeData: HomeData = HomeData()
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Text(self.viewModel.title)
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0...homeData.companys.count-1), id: \.self) { company in
                    Image(homeData.companys[company % homeData.companys.count])
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(10)
                        .clipShape(Rectangle())
                }
            }
        }
    }
}
