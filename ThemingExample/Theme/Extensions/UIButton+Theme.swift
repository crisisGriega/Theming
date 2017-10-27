//
//  UIButton+Theme.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 12/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit


extension UIButton {
    
    fileprivate struct AssociatedKeys {
        static var Style = "ggg_StyleString";
    }
    
    @IBInspectable var style: String {
        get {
            guard let objc = objc_getAssociatedObject(self, &AssociatedKeys.Style), let valueString: String = objc as? String else {
                objc_setAssociatedObject(self, &AssociatedKeys.Style, "", objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC);
                return "";
            }
            return valueString;
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.Style, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
    }
    
    // MARK: Lifestyle
    convenience init(withStyle style: String) {
        self.init();
        self.style = style;
        self.setStyles();
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib();
        self.setStyles();
    }
    
    override open func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow);
        
        if newWindow == nil {
            NotificationCenter.default.removeObserver(self, name: Theme.Notification.DidChanged, object: nil);
        }
        else {
            NotificationCenter.default.addObserver(self, selector: #selector(UITextView.setStyles), name: Theme.Notification.DidChanged, object: nil);
        }
    }
    
    
    // MARK: Public 
    @objc public func setStyles() {
        guard let theme = Theme.currentTheme, let style = theme[self.style] else {
            return;
        }
        
        self.applyStyle(style, for: .normal);
        
        if let selected = style.selected {
            self.applyStyle(selected, for: .selected);
        }
        
        if let disabled = style.disabled {
            self.applyStyle(disabled, for: .disabled);
        }
        
        if let highlighted = style.highlighted {
            self.applyStyle(highlighted, for: .highlighted);
        }
    }
}

// MARK: Private functions
extension UIButton {
    fileprivate func applyStyle(_ style: Style, for state: UIControlState) {
        
        if let textColor = style.textColor {
            self.setTitleColor(textColor, for: state);
        }
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment(textAlignment: style.textAlignment);
        
        if style.upperCase {
            self.setTitle(self.title(for: state)?.uppercased(), for: state);
        }
        
        if let font = style.font, let titleLabel = self.titleLabel {
            titleLabel.font = font;
        }
        
        if let backgroundColor = style.backgroundColor {
            self.setBackgroundImage(self.image(with: backgroundColor), for: state);
        }
    }
    
    fileprivate func image(with color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1);
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0);
        color.setFill();
        UIRectFill(rect);
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return image;
    }
}

