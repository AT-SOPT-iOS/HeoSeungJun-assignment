import UIKit

extension UIFont {
    static func customBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.bold.rawValue, size: size)!
    }
    
    static func customBlack(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.black.rawValue, size: size)!
    }
    
    static func customExtraBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.extraBold.rawValue, size: size)!
    }
    
    static func customExtraLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.extraLight.rawValue, size: size)!
    }
    
    static func customLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.light.rawValue, size: size)!
    }
    
    static func customMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.medium.rawValue, size: size)!
    }
    
    static func customRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.regular.rawValue, size: size)!
    }
    
    static func customSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.semiBold.rawValue, size: size)!
    }
    
    static func customThin(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontName.thin.rawValue, size: size)!
    }
}
