import UIKit


extension UIView {
  
  func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
    gradientLayer.opacity = 1
    gradientLayer.frame = self.bounds
    
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
}

extension UIColor {
    
    static func backgroundColor() -> UIColor? {
        UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    }
    
    static func topTextColor() -> UIColor? {
        UIColor(red: 159/255, green: 37/255, blue: 255/255, alpha: 1)
    }
    
    static func bottomTextColor() -> UIColor? {
        UIColor(red: 37/255, green: 72/255, blue: 255/255, alpha: 1)
    }
    
    static func topBackgroundColor() -> UIColor? {
        UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
    }
    
    static func bottomBackgroundColor() -> UIColor? {
        UIColor(red: 14/255, green: 8/255, blue: 40/255, alpha: 1)
    }
}


