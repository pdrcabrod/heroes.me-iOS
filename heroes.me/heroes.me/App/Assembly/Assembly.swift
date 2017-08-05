//
//  Assembly.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodríguez. All rights reserved.
//

import Foundation

struct Assembly {
    fileprivate static let instance = Assembly()
    
    /**
     Prevent default initializer
     */
    private init() {}
}

func Assembler() -> Assembly {
    return Assembly.instance
}
