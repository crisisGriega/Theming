//
//  MainViewModel.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 14/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit

class MainViewModel {
    
    lazy var theme1: Stylesheet = {
        var _theme1 = Stylesheet();
        
        let h1 = Style(font: UIFont(name: "Verdana-Bold", size: 14.0), textColor: .black, textAlignment: .center, upperCase: true);
        _theme1["h1"] = h1;
        
        let h2 = Style(font: UIFont(name: "Verdana-Bold", size: 12.0), textColor: .darkGray, textAlignment: .justified);
        _theme1["h2"] = h2;
        
        let body = Style(font: UIFont(name: "Verdana", size: 12.0), textColor: .gray);
        _theme1["body"] = body;
        
        let buttonHighlighted = Style(font: UIFont(name: "Verdana", size: 12.0), textColor: .gray, textAlignment: .center);
        
        let button = Style(font: UIFont(name: "Verdana", size: 12.0), textColor: .blue, textAlignment: .center, highlighted: buttonHighlighted);
        _theme1["button"] = button;
        
        return _theme1;
    }();
    
    lazy var theme2: Stylesheet = {
        var _theme2 = Stylesheet();
        
        let h1 = Style(font: UIFont(name: "Arial-Bold", size: 12.0), textColor: Theme2ColorPalette.darkRed.colorValue);
        _theme2["h1"] = h1;
        
        let h2 = Style(font: UIFont(name: "Arial", size: 11.0), textColor: Theme2ColorPalette.red.colorValue, textAlignment: .right);
        _theme2["h2"] = h2;
        
        let body = Style(font: UIFont(name: "Arial", size: 9.0), textColor: Theme2ColorPalette.text.colorValue);
        _theme2["body"] = body;
        
        let buttonHighlighted = Style(font: UIFont(name: "Arial", size: 11.0), textColor: Theme2ColorPalette.text.colorValue);
        
        let button = Style(font: UIFont(name: "Arial", size: 11.0), textColor: Theme2ColorPalette.red.colorValue, highlighted: buttonHighlighted);
        _theme2["button"] = button;
        
        return _theme2;
    }();
    
    init() {
        Theme.currentTheme = self.theme1;
    }
    
    func toggleTheme() {
        guard let currentTheme = Theme.currentTheme else {
            Theme.currentTheme = self.theme1;
            return;
        }
        
        if currentTheme == self.theme1 {
            Theme.currentTheme = self.theme2;
        }
        else {
            Theme.currentTheme = self.theme1;
        }
    }
}

enum Theme2ColorPalette: Int, EnumColorable {
    case darkRed = 0x480101;
    case red = 0x8d0101;
    case text = 0x411e1e;
}
