//
//  UIControlContentHorizontalAlignment+NSTextAlignment.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 13/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit

extension UIControlContentHorizontalAlignment {
    init(textAlignment: NSTextAlignment) {
        switch textAlignment {
        case .center:
            self = .center;
        case .right:
            self = .right;
        case .justified:
            self = .fill;
        default:
            self = .left;
        }
    }
}
