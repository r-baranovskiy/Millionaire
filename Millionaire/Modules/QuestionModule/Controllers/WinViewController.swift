import UIKit

final class WinViewController: UIViewController {

    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFill)
    private let mainLogo = UIImageView(image: UIImage(named: "logoLarge")!, contentMode: .scaleAspectFit)
    
    private let gameStopped = UILabel(text: "ИГРА ОКОНЧЕНА", font: .systemFont(ofSize: 28))
    private let yourWinnings = UILabel(text: "Ваш выигрыш: 1000₽", font: .systemFont(ofSize: 22))
    
    private let winImagView = UIImageView(image: UIImage(named: "winResultIcon")!, contentMode: .scaleAspectFit)
    
    private let playAgainButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainButton.setTitle("играть еще раз", for: .normal)
        
        playAgainButton.addTarget(self, action: #selector(playAgainButtonPressed), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc
    private func playAgainButtonPressed() {
        // code
    }
}

// MARK: - WinViewControllerConstraints
extension WinViewController {
    private func setConstraints() {
        self.view.addSubview(gradientlayer)
        self.view.addSubview(mainLogo)
        self.view.addSubview(gameStopped)
        self.view.addSubview(yourWinnings)
        self.view.addSubview(winImagView)
        self.view.addSubview(playAgainButton)
        
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
            
            winImagView.topAnchor.constraint(equalTo: yourWinnings.bottomAnchor, constant: 30),
            winImagView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            winImagView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            winImagView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
            
            playAgainButton.topAnchor.constraint(equalTo: winImagView.bottomAnchor, constant: 20),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            playAgainButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
