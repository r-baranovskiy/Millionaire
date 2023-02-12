import UIKit

final class LoseViewController: UIViewController {
    
    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFill)
    private let mainLogo = UIImageView(image: UIImage(named: "logoLarge")!, contentMode: .scaleAspectFit)
    
    private let gameStopped = UILabel(text: "ИГРА ОКОНЧЕНА", font: .systemFont(ofSize: 28))
    private let yourWinnings = UILabel(text: "Ваш выигрыш: 0₽", font: .systemFont(ofSize: 22))
    
    private let loseImageView = UIImageView(image: UIImage(named: "loseResultIcon")!, contentMode: .scaleAspectFit)
    
    private let playAgainButton = CustomButton()
    private let scoreButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.setTitle("играть еще раз", for: .normal)
        scoreButton.setTitle("рейтинг", for: .normal)
        playAgainButton.addTarget(self, action: #selector(playAgainButtonPressed), for: .touchUpInside)
        scoreButton.addTarget(self, action: #selector(scoreButtonPressed), for: .touchUpInside)
        configureAppearance()
        setConstraints()
    }
    
    func configureAppearance() {
        //SoundManager.shared.stopSound()
        yourWinnings.text = "Ваш выигрыш: \(QuestionManager.shared.currentQuestionCost)"
    }
    
    @objc
    private func playAgainButtonPressed() {
        QuestionManager.shared.newGame()
        navigationController?.popToRootViewController(animated: false)
    }
    
    @objc
    private func scoreButtonPressed() {
        let vc = ScoreViewController()
        QuestionManager.shared.newGame()
        navigationController?.pushViewController(vc, animated: false)
    }
}

// MARK: - LoseViewControllerConstraints
extension LoseViewController {
    private func setConstraints() {
        self.view.addSubview(gradientlayer)
        self.view.addSubview(mainLogo)
        self.view.addSubview(gameStopped)
        self.view.addSubview(yourWinnings)
        self.view.addSubview(loseImageView)
        self.view.addSubview(playAgainButton)
        self.view.addSubview(scoreButton)
        
        NSLayoutConstraint.activate([
            gradientlayer.topAnchor.constraint(equalTo: view.topAnchor),
            gradientlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientlayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            mainLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            gameStopped.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 40),
            gameStopped.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            gameStopped.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            gameStopped.heightAnchor.constraint(equalToConstant: 30),
            
            yourWinnings.topAnchor.constraint(equalTo: gameStopped.bottomAnchor, constant: 10),
            yourWinnings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            yourWinnings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            yourWinnings.heightAnchor.constraint(equalToConstant: 30),
            
            loseImageView.topAnchor.constraint(equalTo: yourWinnings.bottomAnchor, constant: 50),
            loseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            loseImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            loseImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),
            
            playAgainButton.topAnchor.constraint(equalTo: loseImageView.bottomAnchor, constant: 20),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            playAgainButton.heightAnchor.constraint(equalToConstant: 60),
            
            scoreButton.topAnchor.constraint(equalTo: playAgainButton.bottomAnchor, constant: 7),
            scoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            scoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            scoreButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
