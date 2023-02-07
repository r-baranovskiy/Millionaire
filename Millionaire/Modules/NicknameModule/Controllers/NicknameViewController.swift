import UIKit

class CustomTextField: UITextField {

	let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0);

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}

	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
		//test
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
}
class NicknameViewController: UIViewController {
	
	let logoView: UIImageView = {
		let logoImage = UIImageView()
		logoImage.image = UIImage(named: "logoLarge")
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		return logoImage
	}()
	
	let headerLabelView: UILabel = {
		let label = UILabel()
		label.text = "🔐 Регистрация"
		label.font = UIFont(name: "Poppins-SemiBold", size: 28)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let textFieldView: UITextField = {
		let textField = CustomTextField()
		textField.attributedPlaceholder = NSAttributedString(string:"введите свой никнейм", attributes:[NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xDADADA)])
		textField.font = UIFont(name: "Poppins-Regular", size: 14)
//		textField.textColor = UIColor(rgb: 0xDADADA)
		textField.layer.cornerRadius = 10
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor(rgb: 0x48485F).withAlphaComponent(0.1).cgColor
		textField.backgroundColor = UIColor(rgb: 0x2D3142).withAlphaComponent(0.2)
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
    override func viewDidLoad() {
		view.backgroundColor = .black
		setBackground()
		
		
		//Добавление блоков с элементами
		view.addSubview(logoView)
		view.addSubview(headerLabelView)
		view.addSubview(textFieldView)
		
		
		// Добавление констрейнтов для блоков
		logoViewConstraints()
		headerLabelViewConstraints()
		textFieldViewConstraints()
        super.viewDidLoad()
        
    }
	
	func setBackground() {
		let background = UIImage(named: "backgroundBlue")

		var imageView : UIImageView!
		imageView = UIImageView(frame: view.bounds)
		imageView.contentMode =  UIView.ContentMode.scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = background
		imageView.center = view.center
		view.addSubview(imageView)
		self.view.sendSubviewToBack(imageView)
	}
	
	func logoViewConstraints() {
		logoView.widthAnchor.constraint(equalToConstant: 250).isActive = true
		logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
		logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
	}
	
	func headerLabelViewConstraints() {
		headerLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		headerLabelView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
	}
	
	func textFieldViewConstraints() {
		textFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		textFieldView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: 30).isActive = true
		textFieldView.heightAnchor.constraint(equalToConstant: 45).isActive = true
	}
	
}
