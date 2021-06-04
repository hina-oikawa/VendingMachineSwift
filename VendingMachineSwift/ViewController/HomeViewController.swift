//
//  HomeViewController.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/02.
//

import UIKit
import Combine
import Foundation
import SwiftUI

class HomeViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    let homeViewModel = HomeViewModel()
    let loginViewModel = LoginViewModel()
    let productViewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(
            rootView: HomeView(viewModel: self.homeViewModel, productViewModel: self.productViewModel)
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
        
        self.productViewModel.$presentFlg
            .compactMap { $0 }
            .sink { [weak self] _ in
                self?.show(
                    ProductViewController(),
                    sender: nil)
            }
            .store(in: &cancellables)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.loginViewModel.isLogin == false {
            self.present(
                LoginViewController(),
                animated: false,
                completion: nil
            )
        }
    }
}
