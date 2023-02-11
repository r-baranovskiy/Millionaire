
import UIKit

final class StartViewController: UIViewController {
    
    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFill)
    private let mainLogo = UIImageView(image: UIImage(named: "logoLarge")!, contentMode: .scaleAspectFit)
    
    private let welcomeLabel = UILabel(text: "добро пожаловать в игру", font: UIFont.systemFont(ofSize: 22))
    private let whoWontLabel = UILabel(text: "", font: UIFont.systemFont(ofSize: 28, weight: .bold))
    
    private let rulesButton = CustomButton()
    private let startGameButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        self.whoWontLabel.colorString(text: "КТО ХОЧЕТ СТАТЬ МИЛЛИОНЕРОМ", coloredText: "МИЛЛИОНЕРОМ")
        
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
        startGameButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)

        settingsButtons()
        setConstraints()
    }
    
    @objc
    private func rulesButtonPressed() {
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func startGameButtonPressed() {
        let vc = NicknameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func settingsButtons() {
        rulesButton.setTitle("правила игры", for: .normal)
        rulesButton.layer.cornerRadius = 10
        
        startGameButton.setTitle("играть", for: .normal)
        startGameButton.layer.cornerRadius = 10
        startGameButton.layer.borderWidth = 2
    }
}

// MARK: - StartViewControllerConstraints
extension StartViewController {
    private func setConstraints() {
        self.view.addSubview(gradientlayer)
        self.view.addSubview(mainLogo)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(whoWontLabel)
        self.view.addSubview(rulesButton)
        self.view.addSubview(startGameButton)
        
        NSLayoutConstraint.activate([
            gradientlayer.topAnchor.constraint(equalTo: view.topAnchor),
            gradientlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientlayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            mainLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            welcomeLabel.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 60),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 25),
            
            whoWontLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15),
            whoWontLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            whoWontLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            whoWontLabel.heightAnchor.constraint(equalToConstant: 100),
            
            rulesButton.topAnchor.constraint(equalTo: whoWontLabel.bottomAnchor, constant: 30),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            rulesButton.heightAnchor.constraint(equalToConstant: 45),
            
            startGameButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 10),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            startGameButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

