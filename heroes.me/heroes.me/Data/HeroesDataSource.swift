//
//  HeroesDataSource.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import Foundation

typealias GetHeroesCompletionClosure = ([Hero]?, Error?) -> Void

protocol HeroesDataSource {
    func getHeroes (completion: @escaping GetHeroesCompletionClosure)
}
