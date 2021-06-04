//
//  ProductView.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/04.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    let companyName: String = ""
    
    var body: some View {
        Text("ProductView")
    }
}
