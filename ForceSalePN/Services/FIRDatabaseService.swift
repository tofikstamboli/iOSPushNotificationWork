//
//  FIRDatabaseService.swift
//  ForceSalePN
//
//  Created by iMac on 11/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import Foundation
import Firebase

enum FIRDatabaseRefrence : String {
    case products = "products"
}

class FirDatabaseService {
    
    private init() {}
    static let shared = FirDatabaseService()
    
    func refrence(_ databaseRefrence: FIRDatabaseRefrence) -> DatabaseReference {
        
        return Database.database().reference().child(databaseRefrence.rawValue)
    }
    
    func observe(_ databaseRefrence: FIRDatabaseRefrence, completion: @escaping(DataSnapshot) -> Void) {
        refrence(databaseRefrence).observe(.value) { (shapshot) in
            completion(shapshot)
        }
    }
    
    func post(parameters: [String: Any], to databaseReference: FIRDatabaseRefrence) {
        refrence(databaseReference).childByAutoId().setValue(parameters)
    }
}
