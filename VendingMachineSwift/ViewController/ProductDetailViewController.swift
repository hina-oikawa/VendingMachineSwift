//
//  ProductDetailViewController.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/15.
//

import UIKit
import SwiftUI
import Combine
import Foundation

class ProductDetailViewController: UIViewController {
    var viewModel = ProductDetailViewModel()
    var cancellables = Set<AnyCancellable>()
    public var productName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(
            rootView: ProductDetailView(viewModel: self.viewModel)
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
        self.isModalInPresentation = true
        
        self.viewModel.$isDismiss
            .compactMap { $0 }
            .sink { [weak self] id in
                self?.dismiss(
                    animated: true,
                    completion: nil)
            }
            .store(in: &cancellables)
    }
    
}
