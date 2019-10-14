//
//  Product.swift
//  ForceSalePN
//
//  Created by iMac on 10/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import Foundation


struct Product {
    let title : String
    let cost : Double
    
    init(title: String, cost : Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String,
        let cost = valueDict["cost"] as? Double
            else{ return nil}
        self.title = title
        self.cost = cost
    }
    
    func price() -> String {
        return "$\(cost)"
    }
}
