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
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(
            rootView: HomeView(viewModel: self.homeViewModel, productViewModel: self.productViewModel)
        )
        addChild(vc)
        view.addSubview(vc.view)
        self.view.alpha = 0
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        vc.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        NSLayoutConstraint.activate([/* ... */])
        vc.didMove(toParent: self)
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true,
            block: { (timer) in
                self.animateView(self.view)
            }
        )
        
        self.productViewModel.$presentFlg
            .compactMap { $0 }
            .sink { [weak self] _ in
                guard let vc = self else { return }
                if vc.productViewModel.presentFlg {
                    vc.show(
                        ProductViewController(),
                        sender: nil
                    )
                    
                }
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
            self.loginViewModel.isLogin = true
        }
    }
    
    func animateView(_ viewAnimate: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            viewAnimate.alpha = 1
        }
    }
}
