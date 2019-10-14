//
//  ProductCell.swift
//  ForceSalePN
//
//  Created by iMac on 10/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var titleLable : UILabel!
    @IBOutlet weak var priceLable : UILabel!
    
    func Configure(with product: Product){
        titleLable.text = product.title
        priceLable.text = product.price()
    }

}
