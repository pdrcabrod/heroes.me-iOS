//
//  Assembly+Heroes.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodríguez. All rights reserved.
//

import UIKit

extension Assembly {

    func provideHeroesNavigationController() -> UIViewController {
        let viewController = Assembler().provideHeroesListViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = UIColor.navigationBar
        navigationController.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white
        ]
        
        return navigationController
    }

    func provideHeroesListViewController() -> HeroesListViewController {
        let presenter = HeroesListPresenter(
            heroesDataSource : Assembler().provideHeroesDataSource()
        )
        
        let viewController = HeroesListViewController(
            presenter: presenter
        )
        
        presenter.view = viewController
        
        return viewController
    }

}
