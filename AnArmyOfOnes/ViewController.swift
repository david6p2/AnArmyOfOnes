//
//  ViewController.swift
//  AnArmyOfOnes
//
//  Created by David Céspedes on 17/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var rate: RateConvertion?
    
    // MARK: - IBOutlet
    @IBOutlet var billsToExTxtFld: UITextField!
    @IBOutlet var exchangeBttn: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet var GBPRateLbl: UILabel!
    @IBOutlet var EURRateLbl: UILabel!
    @IBOutlet var JPYRateLbl: UILabel!
    @IBOutlet var BRLRateLbl: UILabel!
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currencies = Currency.currencies
        print("These are the currencies \(currencies)")
        
        self.exchangeBttn.setBackgroundImage(blackColorImg(), forState: .Normal)
        self.exchangeBttn.setBackgroundImage(blackAlphaColorImg(), forState: .Disabled)
        self.exchangeBttn.setBackgroundImage(hugeMagentaColorImg(), forState: .Highlighted)
        
        self.billsToExTxtFld.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func exchangeMyMoney(sender: UIButton) {
        self.billsToExTxtFld.resignFirstResponder()
        activityIndicatorView.startAnimating()
        self.downloadRatesForBase("USD") { (rate) -> Void in
            self.activityIndicatorView.stopAnimating()
            print("The Rate Convertion is \(rate)")
            let rates = rate.rates
            if let amountToExchange = float_t(self.billsToExTxtFld.text!){
                self.GBPRateLbl.text = "\(amountToExchange*(rates["GBP"]?.floatValue)!)"
                self.EURRateLbl.text = "\(amountToExchange*(rates["EUR"]?.floatValue)!)"
                self.JPYRateLbl.text = "\(amountToExchange*(rates["JPY"]?.floatValue)!)"
                self.BRLRateLbl.text = "\(amountToExchange*(rates["BRL"]?.floatValue)!)"
            }
        }
    }
    
    @IBAction func textFieldDidChange(sender: UITextField) {
        if sender == self.billsToExTxtFld{
            //Reset rates everytime new text is typed
            self.GBPRateLbl.text = "0.0"
            self.EURRateLbl.text = "0.0"
            self.JPYRateLbl.text = "0.0"
            self.BRLRateLbl.text = "0.0"
            if ((sender.text?.isEmpty) == nil || sender.text == ""){
                self.exchangeBttn.enabled = false
            }
            else{
                self.exchangeBttn.enabled = true
            }
        }
    }
}

// MARK: - VC Extension
extension ViewController {
    // MARK: - Networking calls
    func downloadRatesForBase(base: String, completion: (rate: RateConvertion) -> Void) {
        Alamofire.request(FixerRouter.LastestRatesFromCurrency(base))
            .responseJSON { response in
                // 1.
                guard response.result.isSuccess else {
                    print("Error while fetching rates: \(response.result.error)")
                    
                    return
                }
                
                // 2.
                guard let responseJSON = response.result.value as? [String: AnyObject],
                    date = responseJSON["date"] as? String,
                    base = responseJSON["base"] as? String,
                    rates = responseJSON["rates"] as? [String: NSNumber] else {
                        print("Invalid rates information received from the service")
                        return
                }
                
                // 3.
                let rate = RateConvertion(date: date, base: base, rates: rates)
                
                // 4.
                completion(rate: rate)
        }
    }
    // MARK: - Color Image Generators
    func hugeMagentaColorImg() -> UIImage{
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor(red: 239/255, green: 3/255, blue: 137/255, alpha: 1.0).CGColor)
        CGContextFillRect(context, rect)
        
        let hugeMagentaImgClr = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return hugeMagentaImgClr
    }
    
    func blackColorImg() -> UIImage{
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextFillRect(context, rect)
        
        let blackColorImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return blackColorImg
    }
    
    func blackAlphaColorImg() -> UIImage{
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25).CGColor)
        CGContextFillRect(context, rect)
        
        let blackAlphaColorImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return blackAlphaColorImg
    }
    
    

}

// MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.exchangeMyMoney(self.exchangeBttn)
        return true
    }
}

