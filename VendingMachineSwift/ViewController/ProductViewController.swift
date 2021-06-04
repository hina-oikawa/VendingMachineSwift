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
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(
            rootView: ProductView(viewModel: self.viewModel)
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
        
    }
}
