//
//  Theme.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 12/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit

public typealias Stylesheet = Dictionary<String, Style>

open class Theme {
    struct Notification {
        static let DidChanged = Foundation.Notification.Name(rawValue: "Theme.Notification.didChanged")
    }
    
    public static var currentTheme: Stylesheet? {
        willSet {
            UILabel.loadThemeSwizzling();
            UITextView.loadThemeSwizzling();
        }
        didSet {
            NotificationCenter.default.post(name: Theme.Notification.DidChanged, object: nil);
        }
    }
    
}

public func ==(lhs: Stylesheet, rhs: Stylesheet) -> Bool {
    
    let stylesheet2String = {(_ stylesheet: Stylesheet) -> String? in
        return (stylesheet.flatMap { (_ key: String, _ value: Style) -> String? in
            return "\(key)=\(value)";
        }).joined(separator: ";");
    };
    
    return stylesheet2String(lhs) == stylesheet2String(rhs);
}
