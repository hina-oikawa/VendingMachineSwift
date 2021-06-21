//
//  ProductViewController.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/04.
//

import UIKit
import Combine
import SwiftUI

class ProductViewController: UIViewController {
    let viewModel = ProductViewModel()
    let productDetailViewModel = ProductDetailViewModel()
    var cancellables = Set<AnyCancellable>()
    public var companyName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(
            rootView: ProductView(viewModel: self.viewModel,
                                  detailViewModel: self.productDetailViewModel,
                                  companyName: self.companyName)
        )
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        vc.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        NSLayoutConstraint.activate([/* ... */])
        vc.didMove(toParent: self)
        
        self.productDetailViewModel.$presentFlg
            .compactMap { $0 }
            .sink { [weak self] _ in
                guard let vc = self else { return }
                if vc.productDetailViewModel.presentFlg {
                    let productDetailVC = ProductDetailViewController()
                    productDetailVC.viewModel = vc.productDetailViewModel
                    vc.present(
                        productDetailVC,
                        animated: true,
                        completion: nil
                    )
                }
            }
            .store(in: &cancellables)
        
    }
}
