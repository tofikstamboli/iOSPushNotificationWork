//
//  MainViewController.swift
//  ForceSalePN
//
//  Created by iMac on 10/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        FirDatabaseService.shared.post(parameters: ["title" : "Nice Shirt",
//                                                    "cost" : "25.00"], to: .products)
        
        FirDatabaseService.shared.observe(.products) {(snapshot) in
            guard let productSnapShot = ProductSnapshot(snapshot: snapshot) else {return}
            print(productSnapShot.products)
        }
    }
    
    @IBAction func onTappedAdd(){
        AlertService.addProductAlert(in: self) {(product) in
            self.products.append(product)
            self.collectionView.reloadData()
        }
    }
    @IBAction func onTappedSubscribe(){
        AlertService.subscribeAlert(in: self)
    }
}


extension MainViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
         let product = products[indexPath.row]
         cell.Configure(with: product)
         return cell
    }
   
}
