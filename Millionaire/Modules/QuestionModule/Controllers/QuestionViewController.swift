import UIKit

class QuestionViewController: UIViewController {
    
    private let mainLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logoMedium")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    private var hitButtonsStackView = UIStackView()
    
    private var timerStackView = UIStackView()
    private let timerImageView = UIImageView()
    public let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func helpButton(name: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private lazy var fiftyButton = helpButton(name: "helpIcon1", action: #selector(fiftyButtonAction))
    private lazy var hallHelpButton = helpButton(name: "helpIcon2", action: #selector(hallHelpButtonAction))
    private lazy var callFriendsButton = helpButton(name: "helpIcon3", action: #selector(callFriendsButtonAction))
    private lazy var noticeButton = helpButton(name: "helpIcon4", action: #selector(noticeButtonAction))
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorTop: .topBackgroundColor() ?? .black, colorBottom: .bottomBackgroundColor() ?? .black)
        
        setupView()
        setConstraints()
    }
    
    @objc func fiftyButtonAction() {
        print("Подсказка 50/50")
    }
    
    @objc func hallHelpButtonAction() {
        print("Помощь зала")
    }
    
    @objc func callFriendsButtonAction() {
        print("Звонок другу")
    }
    
    @objc func noticeButtonAction() {
        print("Pfvtnrb")
    }
    
}


extension QuestionViewController {

// MARK: - Setup Views
    
    private func setupView() {
        timerImageView.image = UIImage(systemName: "clock.fill")
        timerImageView.tintColor = .white
        timerImageView.contentMode = .scaleAspectFit
        timerImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timerImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        timerStackView = UIStackView(subviews: [timerImageView, timerLabel],
                                     axis: .horizontal,
                                     spacing: 2,
                                     aligment: .center,
                                     distribution: .fillProportionally)
        
        hitButtonsStackView = UIStackView(subviews: [fiftyButton, hallHelpButton, timerStackView, callFriendsButton, noticeButton],
                                          axis: .horizontal,
                                          spacing: 15,
                                          aligment: .center,
                                          distribution: .fillProportionally)

        
    }
    
// MARK: - Set constraints

    private func setConstraints() {
        self.view.addSubview(mainLogo)
        self.view.addSubview(hitButtonsStackView)
        
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalToConstant: 158),
            mainLogo.heightAnchor.constraint(equalToConstant: 158),
            
            timerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hitButtonsStackView.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 25),
            hitButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hitButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hitButtonsStackView.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
