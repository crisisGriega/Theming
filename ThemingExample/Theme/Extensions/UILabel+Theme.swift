//
//  UILabel+Theme.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 13/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit

extension UILabel {
    
    fileprivate struct AssociatedKeys {
        static var Style = "ggg_StyleString";
    }
    
    private static var __once: () = {
        let originalSelector = #selector(setter: UILabel.text);
        let swizzledSelector = #selector(UILabel.ggg_setText(_:));
        
        let originalMethod = class_getInstanceMethod(UILabel.self, originalSelector);
        let swizzledMethod = class_getInstanceMethod(UILabel.self, swizzledSelector);
        
        let didAddMethod = class_addMethod(UILabel.self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!));
        
        if didAddMethod {
            class_replaceMethod(UILabel.self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!));
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!);
        }
    }();
    
    
    // MARK: Lifecycle
    open class func loadThemeSwizzling() {
        // make sure this isn't a subclass
        if self !== UILabel.self {
            return;
        }
        
        _ = UILabel.__once;
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
        guard let theme = Theme.currentTheme, let style = theme[style] else {
            return;
        }
        
        if let textColor = style.textColor {
            self.textColor = textColor;
        }
        
        if let font = style.font {
            self.font = font;
        }
        
        self.textAlignment = style.textAlignment;
        
        if style.upperCase {
            self.text = self.text?.uppercased();
        }
    }
    
    
    // MARK: Method Swizzling
    
    @objc func ggg_setText(_ newValue: NSString?) {
        guard let theme = Theme.currentTheme, let style = theme[style], let newText = newValue as String? else {
            self.ggg_setText(newValue);
            return;
        }
        
        let wholeTextRange = NSMakeRange(0, newText.characters.count);
        let paragraphStyle = NSMutableParagraphStyle();
        paragraphStyle.alignment = style.textAlignment;
        
        if let lineSpacing = style.lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing;
        }
        
        let stringText = style.upperCase ? newText.uppercased() : newText;
        let attributedString = NSMutableAttributedString(string: stringText);
        
        if let font = style.font {
            attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: wholeTextRange);
        }
        
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: wholeTextRange);
        
        if let textColor = style.textColor {
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: textColor, range: wholeTextRange);
        }
        
        
        self.attributedText = attributedString;
    }
}
