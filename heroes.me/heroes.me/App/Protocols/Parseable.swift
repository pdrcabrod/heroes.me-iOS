//
//  Parseable.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 5/8/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

protocol Parseable {
    
    associatedtype ParseableItem
    associatedtype Item
    
    func parse(element: ParseableItem) -> Item?
    
}

extension Parseable {
    
    func parseArray(elements: [ParseableItem]) -> [Item] {
        
        var elementsToReturn = [Item]()
        
        for parseable in elements {
            if let item = parse(element: parseable) {
                elementsToReturn.append(item)
            }
        }
        
        return elementsToReturn
    }
    
    
}
