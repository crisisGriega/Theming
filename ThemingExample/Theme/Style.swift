//
//  Style.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 12/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit


open class Style {
    let font: UIFont?;
    let textColor: UIColor?;
    let textAlignment: NSTextAlignment;
    let upperCase: Bool;
    let backgroundColor: UIColor?;
    let lineSpacing: CGFloat?;
    let selected: Style?;
    let highlighted: Style?;
    let disabled: Style?;
    
    init(font: UIFont? = nil,
         textColor: UIColor? = nil,
         textAlignment: NSTextAlignment = .natural,
         upperCase: Bool = false,
         bgColor: UIColor? = nil,
         lineSpacing: CGFloat? = nil,
         selected: Style? = nil,
         highlighted: Style? = nil,
         disabled: Style? = nil)
    {
        self.font = font;
        self.textColor = textColor;
        self.textAlignment = textAlignment;
        self.upperCase = upperCase;
        self.backgroundColor = bgColor;
        self.lineSpacing = lineSpacing;
        self.selected = selected;
        self.highlighted = highlighted;
        self.disabled = disabled;
    }
}

extension Style: CustomStringConvertible {
    open var description: String {
        return "STYLE\n" +
            "font: \(String(describing: self.font))\n" +
            "textColor: \(String(describing: self.textColor))\n" +
            "textAlignment: \(self.textAlignment)\n" +
            "uppercase: \(self.upperCase)\n" +
            "backgroundColor: \(String(describing: self.backgroundColor))\n" +
            "lineSpacing: \(String(describing: self.lineSpacing))\n" +
            "selected: \(String(describing: self.selected))\n" +
            "highlighted: \(String(describing: self.highlighted))\n" +
            "disabled: \(String(describing: self.disabled))\n";
    }
}
