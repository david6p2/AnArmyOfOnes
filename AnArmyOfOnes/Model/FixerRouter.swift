//
//  FixerRouter.swift
//  AnArmyOfOnes
//
//  Created by David Céspedes on 18/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import Foundation
import Alamofire

public enum FixerRouter: URLRequestConvertible {
    static let baseURLPath = "http://api.fixer.io"
    
    //Just one case right now, but the switch can be very useful in the near future
    case LastestRatesFromCurrency(String)
    
    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {
            case .LastestRatesFromCurrency(let base):
                let params = [ "base" : base ]
                return ("/latest", .GET, params)
            }
        }()
        
        let URL = NSURL(string: FixerRouter.baseURLPath)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
}