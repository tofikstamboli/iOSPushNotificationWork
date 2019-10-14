//
//  ProductSnapshot.swift
//  ForceSalePN
//
//  Created by iMac on 11/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import Foundation
import Firebase

struct ProductSnapshot {
    let products: [Product]
    init?(snapshot: DataSnapshot) {
        guard let snapDic = snapshot.value as? [String: [String : Any]] else {return nil}
        var products = [Product]()
        for snap in snapDic {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
        }
        self.products = products
    }
}
