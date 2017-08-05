//
//  Assembly+DataSource.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 5/8/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//


extension Assembly {
    
    func provideHeroesDataSource() -> HeroesDataSource {
        return HeroesAPIDataSource(parser: HeroParser())
    }
    
}

