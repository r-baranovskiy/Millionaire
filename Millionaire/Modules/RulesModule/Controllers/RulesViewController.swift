import UIKit

final class RulesViewController: UIViewController {
    
    private let gradientlayer = UIImageView(image: UIImage(named: "backgroundBlue")!, contentMode: .scaleAspectFill)
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
        textView.text = "Игра Кто хочет стать миллионером? - это конкурс викторина, в котором участники должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень. Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, участники не имеют никаких временных ограничений для предоставления ответа. Участники также получают три вида подсказок, чтобы помочь себе, если они застряли на конкретном вопросе. Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит три вопроса. Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность. Например: вопросы 1-3 составляют первый уровень и будут содержать самые простые вопросы. Второй уровень (вопросы 4–6) будет несколько сложнее, за ним следует третий уровень (вопросы 7–9). Четвертый уровень (вопросы 10–12) будет состоять из действительно сложных вопросов, за которыми следует пятый и последний уровень (вопросы 13–15), имеющий самые сложные вопросы в игре. Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов "
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
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Играть", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc
    private func backButtonPressed() {
        let vc = StartViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc
    private func playButtonPressed() {
        let vc = NicknameViewController()
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
        self.view.addSubview(playButton)
        
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
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            playButton.topAnchor.constraint(equalTo: custView.bottomAnchor, constant: 5),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            playButton.widthAnchor.constraint(equalToConstant: 70),
            playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}
