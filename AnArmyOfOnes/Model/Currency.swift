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
    
    static var currencies: [Currency] = {
        var currencies = [Currency]()
        let currenciesNamesArray = ["BRL","EUR","GBP","JPY","USD"]
        
        for currency in currenciesNamesArray{
            let currency = Currency(name: currency, image: UIImage(named: currency)!)
            currencies.append(currency)
        }
        
        return currencies
    }()
}
