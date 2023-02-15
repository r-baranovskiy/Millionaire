import UIKit

final class CustomTextField: UITextField {

	let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0);

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}

	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
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
	
	let userNameTextField: UITextField = {
		let textField = CustomTextField()
		textField.attributedPlaceholder = NSAttributedString(string:"введите свой никнейм", attributes:[NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xDADADA)])
		textField.font = UIFont(name: "Poppins-Regular", size: 14)
		textField.layer.cornerRadius = 10
		textField.layer.borderWidth = 1
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
		textField.layer.borderColor = UIColor(rgb: 0x48485F).withAlphaComponent(0.1).cgColor
		textField.backgroundColor = UIColor(rgb: 0x2D3142).withAlphaComponent(0.2)
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	let buttonRegistration: UIButton = {
		let button = UIButton()
		button.setBackgroundImage(UIImage(named: "buttonStartGame"), for: .normal)
		button.setTitle("начать игру", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	override func viewDidLoad() {
		view.backgroundColor = .black
		setBackground()
        
        userNameTextField.delegate = self
        
        buttonRegistration.addTarget(self, action: #selector(buttonRegistrationPressed), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        
        keyboardSetting()
		
		//Добавление блоков с элементами
		view.addSubview(logoView)
		view.addSubview(headerLabelView)
		view.addSubview(userNameTextField)
		view.addSubview(buttonRegistration)
		
		
		// Добавление констрейнтов для блоков
		logoViewConstraints()
		headerLabelViewConstraints()
		textFieldViewConstraints()
		buttonViewConstraints()
		super.viewDidLoad()
		
	}
    
    @objc
    private func buttonRegistrationPressed() {
        if (userNameTextField.text?.isEmpty)! {
            alertOkL(title: "Error", messege: "Please enter correct Name")
        } else {
            guard let username = userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
            QuestionManager.shared.currentUsername = username
            
            let vc = QuestionViewController()
            navigationController?.pushViewController(vc, animated: false)
        }
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
    
    private func keyboardSetting() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(NicknameViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(NicknameViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
	
	//Текстфилд с вводом никнейма
	func textFieldViewConstraints() {
		userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		userNameTextField.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: 30).isActive = true
		userNameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
	}
	// Кнопка начать игру
	func buttonViewConstraints() {
		buttonRegistration.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		buttonRegistration.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		buttonRegistration.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		buttonRegistration.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 15).isActive = true
		buttonRegistration.heightAnchor.constraint(equalToConstant: 45).isActive = true
	}
	
	
}
// Экстеншн для цвета
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
	   assert(red >= 0 && red <= 255, "Invalid red component")
	   assert(green >= 0 && green <= 255, "Invalid green component")
	   assert(blue >= 0 && blue <= 255, "Invalid blue component")

	   self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
	   self.init(
		   red: (rgb >> 16) & 0xFF,
		   green: (rgb >> 8) & 0xFF,
		   blue: rgb & 0xFF
	   )
   }
}

extension NicknameViewController {
    @objc
    private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height / 2
            }
        }
    }
}

extension NicknameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

