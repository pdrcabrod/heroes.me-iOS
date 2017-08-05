//
//  HeroesPresenter.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import Foundation

protocol HeroesListView: class {
    
    func startLoadingState()
    func stopLoadingState()
    func showErrorState()
    
    func showHeroesSection(with values: [Hero])
}

class HeroesListPresenter {
    
    weak var view: HeroesListView?
    private let heroesDataSource: HeroesDataSource
    
    init(heroesDataSource: HeroesDataSource) {
        self.heroesDataSource = heroesDataSource;
    }
    
    func viewDidLoad() {
        self.fetchHeroes()
    }
    
    func fetchHeroes() {
        self.view?.startLoadingState()
        self.heroesDataSource.getHeroes { [weak self] (heroes, error) in
            self?.view?.stopLoadingState()
            if let heroes = heroes {
                self?.show(heroes: heroes)
            } else {
                self?.view?.showErrorState()
            }
        }
    }
    
    func show(heroes: [Hero]) {
        self.view?.showHeroesSection(with: heroes)
    }
    
    
}
