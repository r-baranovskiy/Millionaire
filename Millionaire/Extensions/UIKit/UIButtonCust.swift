
import UIKit

extension UIButton {
    convenience init(text: String, borderWidth: CGFloat, font: UIFont){
        self.init()
        
        self.setTitle(text, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.6933501959, green: 0.2938768566, blue: 1, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.red.cgColor
        self.titleLabel?.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
