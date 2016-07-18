//
//  AnArmyOfOnesTests.swift
//  AnArmyOfOnesTests
//
//  Created by David Céspedes on 18/07/16.
//  Copyright © 2016 LSR Marketing Service. All rights reserved.
//

import XCTest
@testable import AnArmyOfOnes

class AnArmyOfOnesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCurrencyWasInit(){
        let currency = Currency(name: "USD", image: UIImage(named: "USD")!)
        XCTAssert(!currency.name.isEmpty, "Currency name is empty")
        XCTAssertNotNil(currency.image, "Currency image is not nil")
    }
    
    func testRateConvertionWasInit(){
        let rate = RateConvertion(date: "2016-07-15", base: "USD", rates: ["BRL": 3.2559, "EUR": 0.89863, "GBP": 0.74834, "JPY": 105.71, "USD": 1.0])
        XCTAssert(!rate.date.isEmpty, "RateConvertion date is empty")
        XCTAssert(!rate.base.isEmpty, "RateConvertion base is empty")
        XCTAssert(rate.rates.count > 0, "RateConvertion doesn't have rates")
        
    }
}
