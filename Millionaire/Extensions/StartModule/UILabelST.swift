

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont){
        self.init()

        self.text = text
        self.font = font
        self.textColor = .white
        self.textAlignment = .center
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    func colorString(text: String?, coloredText: String?, color: UIColor? = UIColor(red: 159/255, green: 37/255, blue: 255/255, alpha: 1)) {

        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!],
                                       range: range)
        self.attributedText = attributedString
    }
}
