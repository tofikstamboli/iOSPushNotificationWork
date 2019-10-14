//
//  AlertService.swift
//  ForceSalePN
//
//  Created by iMac on 10/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import UIKit

class AlertService {
    private init() {} // do not allowed to create instance of this class
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping(Product) -> Void) {
        
        let alert = UIAlertController(title: "New Peoduct", message: "What's for cell", preferredStyle: .alert)
        alert.addTextField {(titleTF) in
            titleTF.placeholder = "Title"
            
        }
        alert.addTextField {(priceTF) in
            priceTF.placeholder = "Price"
            priceTF.keyboardType = .numberPad
        }
        
        let send = UIAlertAction(title: "Send", style: .default) {
            (_) in
            guard let title = alert.textFields?.first?.text,
                  let price = alert.textFields?.last?.text,
                let cost = Double(price)
                else {return}
            
         let product = Product(title: title, cost: cost)
            completion(product)
        }
        
        alert.addAction(send)
        vc.present(alert, animated: true)
        
    }
    
    static func subscribeAlert(in vc : UIViewController) {
        let alert = UIAlertController(title: "Subscribe", message: nil, preferredStyle: .actionSheet)
        let subscribeAction = UIAlertAction(title: "Subscribe", style: .default){(_) in
            
        }
        let unsubscribeAction = UIAlertAction(title: "Unsubscribe", style: .default){(_) in
            
        }
        alert.addAction(subscribeAction)
        alert.addAction(unsubscribeAction)
        vc.present(alert, animated: true)
    }
    
}

