import UIKit

final class RulesViewController: UIViewController {
    
    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFit)
    private let mainLogo = UIImageView(image: UIImage(named: "logoLarge")!, contentMode: .scaleAspectFit)
    
    private let rulesLabel = UILabel(text: "Правила игры", font: .systemFont(ofSize: 42))
    
    private let custView: UIView = {
        let view = UIView()
        view.backgroundColor = .bottomColor()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rulesTextVeiw: UITextView = {
        let textView = UITextView()
        textView.text = "Задача организации, в особенности же консультация с широким активом обеспечивает широкому кругу (специалистов) участие в формировании модели развития. Равным образом укрепление и развитие структуры позволяет оценить значение форм развития. Значимость этих проблем настолько очевидна, что реализация намеченных плановых заданий способствует подготовки и реализации форм развития. С другой стороны начало повседневной работы по формированию позиции в значительной степени обуславливает создание системы обучения кадров, соответствует насущным потребностям. "
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc
    private func backButtonPressed() {
        let vc = StartViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

// MARK: - RulesViewControllerConstraints
extension RulesViewController {
    private func setConstraints() {
        self.view.addSubview(gradientlayer)
        self.view.addSubview(mainLogo)
        self.view.addSubview(rulesLabel)
        self.view.addSubview(custView)
        custView.addSubview(rulesTextVeiw)
        self.view.addSubview(backButton)
        
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
            
            custView.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20),
            custView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            custView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            custView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            
            rulesTextVeiw.topAnchor.constraint(equalTo: custView.topAnchor, constant: 25),
            rulesTextVeiw.leadingAnchor.constraint(equalTo: custView.leadingAnchor, constant: 16),
            rulesTextVeiw.trailingAnchor.constraint(equalTo: custView.trailingAnchor, constant: -16),
            rulesTextVeiw.bottomAnchor.constraint(equalTo: custView.bottomAnchor, constant: -40),
            
            backButton.topAnchor.constraint(equalTo: custView.bottomAnchor, constant: 5),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}
