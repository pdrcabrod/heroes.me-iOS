//
//  HeroesAPIDataSource.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

struct HeroesAPIDataSource : HeroesDataSource {
    
    let parser : HeroParser
    
    init (parser: HeroParser) {
        self.parser = parser
    }

    func getHeroes(completion: @escaping GetHeroesCompletionClosure) {
            Alamofire.request("https://api.myjson.com/bins/wnxgh").responseJSON { response in
                if let json = response.result.value as? [String: Any],
                    let heroesJSON = json["superheroes"] as? [[String : Any]] {
                    
                    let heroes = self.parser.parseArray(elements: heroesJSON )

                    completion(heroes, nil)
                    
                } else {
                    completion(nil, response.error)
            }
        }
    }
    
}


