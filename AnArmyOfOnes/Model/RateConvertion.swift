//
//  RateConvertion.swift
//  AnArmyOfOnes
//
//  Created by David Céspedes on 17/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import Foundation

struct RateConvertion {
    var date: String
    var base: String
    var rates: [String: Float]
    
    init(date: String, base: String, rates: [String: Float]) {
        self.date = date
        self.base = base
        self.rates = rates
        self.rates[base] = 1.0
    }
    
}
