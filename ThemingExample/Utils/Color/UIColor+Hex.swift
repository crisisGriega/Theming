//
//  UIColor+Hex.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 14/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit


public extension UIColor {
    /**
     Adds the ability to create a Colour from an hexadecimal code
     */
    convenience init(hex: Int) {
        // TODO: Check hexadecimal length before separating components so we can pass alpha in the future
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}
