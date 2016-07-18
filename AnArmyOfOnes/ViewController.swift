//
//  ViewController.swift
//  AnArmyOfOnes
//
//  Created by David Céspedes on 17/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currencies = Currency.currencies
        print("These are the currencies \(currencies)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

