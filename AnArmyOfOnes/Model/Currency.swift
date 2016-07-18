//
//  Currency.swift
//  AnArmyOfOnes
//
//  Created by David Céspedes on 17/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import UIKit

struct Currency {
    // MARK: - Properties
    var name: String
    var image: UIImage
    
    //let currencies = ["BRL","EUR","GBP","JPY","USD"]
    ///*
    static var currencies: [Currency] = {
        var currencies = [Currency]()
        let currenciesNamesArray = ["BRL","EUR","GBP","JPY","USD"]
        
        for currency in currenciesNamesArray{
            let currency = Currency(name: currency, image: UIImage(named: currency)!)
            currencies.append(currency)
        }
        
        return currencies
    }()
    //*/
    /*
    static var currencies: [Currency] = {
        var currencies = [Currency]()
        let path = NSBundle.mainBundle().pathForResource("Currencies", ofType: "plist")!
        for entry in NSArray(contentsOfFile: path)! {
            if let name = entry["name"] as? String, image = entry["image"] as? String {
                let currency = Currency(name: name, image: UIImage(named: image)!)
                currencies.append(currency)
            }
        }
        return currencies
    }()
    */
    
    // MARK: - Initializer
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
