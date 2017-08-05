//
//  AppDelegate.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = Assembler().provideHeroesNavigationController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

