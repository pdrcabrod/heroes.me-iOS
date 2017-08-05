//
//  ParserTests.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import XCTest
@testable import heroes_me

class FileJSONReader {
    static func readJSONWith(name: String, fromBundle: Bundle) -> [String: Any]? {
        var jsonToReturn : [String: Any]? = nil
        if let path = fromBundle.path(forResource: name, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    jsonToReturn = jsonResult
                    
                } catch {}
            } catch {}
        }
        return jsonToReturn
    }
    
}

class ParseTests: XCTestCase {
    
    var bundle: Bundle?
    var parser: HeroParser?
    
    override func setUp() {
        super.setUp()
        self.bundle = Bundle(for: type(of: self))
        self.parser = HeroParser()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIncompleteHeroJSONReturnsNil() {
        if let json = FileJSONReader.readJSONWith(name: "IncompleteHero", fromBundle: self.bundle!) {
            
            let hero = self.parser?.parse(element: json)
            XCTAssert(hero == nil, "Hero should be nil since the info is incomple")
            
        }

    }
    
    func testIncorrectPhotoURLHeroJSONReturnsNil() {
        if let json = FileJSONReader.readJSONWith(name: "MalformedURLHero", fromBundle: self.bundle!) {
            
            let hero = self.parser?.parse(element: json)
            XCTAssert(hero == nil, "Hero should be nil since the url is malformed")
            
        }
    }
    
    func testCompleteHeroReturnsAPopulatedHero() {
        if let json = FileJSONReader.readJSONWith(name: "FullInfoHero", fromBundle: self.bundle!) {
            
            let hero = self.parser?.parse(element: json)
            XCTAssert(hero != nil, "Hero should be populated")
            
        }
    }
    
}
