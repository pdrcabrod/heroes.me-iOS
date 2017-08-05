//
//  UIFont+App.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 25/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var bigBold: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: UIFontWeightBold)
    }
    
    static var small: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
    }
    
    static var regular: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
    }

}
