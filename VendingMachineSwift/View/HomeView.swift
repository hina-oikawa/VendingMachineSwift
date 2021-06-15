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
    @ObservedObject var productViewModel: ProductViewModel
    let homeData: HomeData = HomeData()
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Text(self.viewModel.title)
        ScrollView {
            LazyVGrid(columns: self.gridItemLayout, spacing: 20) {
                ForEach((0...self.homeData.companys.count-1), id: \.self) { company in
                    Image(self.homeData.companys[company % self.homeData.companys.count])
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            self.productViewModel.presentProductView(
                                presentFlg: true,
                                companyName: self.homeData.companys[company]
                            )
                        }
                        .clipShape(Rectangle())
                }
            }
        }
    }
}
