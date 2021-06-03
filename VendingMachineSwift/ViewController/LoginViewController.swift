//
//  LoginViewController.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/01.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        
        // TODO: Home画面作成後に有効にする
        let vc = UIHostingController(
            rootView: LoginView(viewModel: self.viewModel)
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
        self.viewModel.fetch()
        
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
