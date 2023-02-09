import UIKit

final class RulesViewController: UIViewController {
    
    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFit)
    private let mainLogo = UIImageView(image: UIImage(named: "logoLarge")!, contentMode: .scaleAspectFit)
    
    private let rulesLabel = UILabel(text: "Правила игры", font: .systemFont(ofSize: 42))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setConstraints()
    }
}

extension RulesViewController {
    private func setConstraints() {
        self.view.addSubview(gradientlayer)
        self.view.addSubview(mainLogo)
        self.view.addSubview(rulesLabel)
        
        NSLayoutConstraint.activate([
            gradientlayer.topAnchor.constraint(equalTo: view.topAnchor),
            gradientlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientlayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            mainLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
    
            rulesLabel.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
