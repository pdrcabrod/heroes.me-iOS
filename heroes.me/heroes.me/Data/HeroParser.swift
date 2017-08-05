//
//  HeroParser.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 5/8/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import Foundation

struct HeroParser: Parseable {
    
    func parse(element: [String : Any]) -> Hero? {
        
        guard let name = element["name"] as? String,
            let urlToPhotoString = element["photo"] as? String,
            let realName = element["realName"] as? String,
            let power = element["power"] as? String,
            let description = element["description"] as? String
            else {
                return nil;
        }
        
        var urlToPhoto : URL
        if let url = URL(string: urlToPhotoString) {
            urlToPhoto = url
        } else {
            return nil
        }
        
        return Hero(name: name, urlToPhoto: urlToPhoto, realName: realName, power: power, description: description)
        
    }
}
