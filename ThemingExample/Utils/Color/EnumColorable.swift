//
//  EnumColorable.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 14/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit


/**
 Gives the ability to create a UIColor from the raw value (in case of enum int)
 */
public protocol EnumColorable : RawRepresentable {}
public extension EnumColorable {
    var colorValue: UIColor? {
        if let hex: Int = self.rawValue as? Int {
            return UIColor(hex: hex);
        }
        else {
            return nil;
        }
    }
}
