//
//  Strings.swift
//  VendingMachineSwift
//
//  Created by 及川ひな on 2021/06/01.
//

import Foundation

struct Strings {
    struct Login {
        let buttonTitle: String = "ログイン"
        let navigationTitle: String = "Login View"
        let idTextFieldPlaceholder: String = "IDを入力"
        let passTextFieldPlaceholder: String = "Passを入力"
        let validCodes: String = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    struct Product {
        let tsumetai: String = "tsumetai"
        let tokuho: String = "tokuho"
        let energy: String = "energy"
        let cola: String = "cola"
        let coffee: String = "coffee"
        let attakai: String = "attakai"
        let nyuusankin: String = "nyuusankin"
        let awamori: String = "awamori"
    }
    
    struct ProductDetail {
        let productDescription: String = "夏にぴったりの商品です"
        let unit: String = "円"
        let price: String = "150"
        let total: String = "合計"
        let fishing: String = "お釣り"
        let settlementButton: String = "決済"
        let countTextFieldPlaceholder: String = "個数を入力"
        let paymentTextFieldPlaceholder: String = "支払い金額を入力"
    }
}
