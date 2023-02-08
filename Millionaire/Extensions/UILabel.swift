import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, textAlignment: NSTextAlignment, color: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
        self.numberOfLines = 7
        self.textAlignment = textAlignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
