import UIKit

class QuestionViewController: UIViewController {
    
    private var currentNumberQuestion = 1
    private var gameTimer = Timer()
    private var durationTimer = 30
    
    private let mainLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logoMedium")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    private var hitButtonsStackView = UIStackView()
    private var answerButtonStackView = UIStackView()
    
    private let timerLabel = UILabel(text: "⏱️ 30",
                                     font: .systemFont(ofSize: 28, weight: .semibold),
                                     textAlignment: .center,
                                     color: .white)
    private lazy var questionNumberLabel = UILabel(text: "Вопрос \(currentNumberQuestion)",
                                              font: .systemFont(ofSize: 28, weight: .semibold),
                                              textAlignment: .center,
                                              color: .white)
    private lazy var summLabel = UILabel(text: "💵 500₽",
                                              font: .systemFont(ofSize: 22, weight: .semibold),
                                              textAlignment: .left,
                                              color: .white)
    private lazy var backgroundQuestion: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .bottomColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var questionLabel = UILabel(text: "Здесь отображается вопрос",
                                             font: .systemFont(ofSize: 16, weight: .regular),
                                             textAlignment: .center,
                                             color: .white)
    private let aButton = CustomButton()
    private let bButton = CustomButton()
    private let cButton = CustomButton()
    private let dButton = CustomButton()

    
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
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorTop: .topBackgroundColor() ?? .black,
                                   colorBottom: .bottomBackgroundColor() ?? .black)
        aButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        cButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        dButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        
        aButton.tag = 1
        bButton.tag = 2
        cButton.tag = 3
        dButton.tag = 4
        
        startTimer()
        updateQuestion()
        setupView()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        durationTimer = 30
    }
    
// MARK: - Timer
    
    private func startTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: (#selector(updateTimer)),
                                         userInfo: nil,
                                         repeats: true)
    }

    @objc func updateTimer() {
        durationTimer -= 1
        timerLabel.text = "⏱️ \(durationTimer)"
        if durationTimer == 0 {
            gameTimer.invalidate()
            timerLabel.text = ""
            showAlertEndOfTime()
        } else if durationTimer <= 10 {
            timerLabel.textColor = .red
        }
    }
    
    @objc private func answerDidTap(_ button: UIButton) {
        if QuestionManager.shared.checkAnswer(buttonTag: button.tag) {
            updateQuestion()
        }
    }
    
    private func updateQuestion() {
        guard let currentQuestion = QuestionManager.shared.fetchNewQuestion() else {
            return
        }
        
        guard let titleAButton = currentQuestion.answers.aAnswer.values.first,
              let titleBButton = currentQuestion.answers.bAnswer.values.first,
              let titleCButton = currentQuestion.answers.cAnswer.values.first,
              let titleDButton = currentQuestion.answers.dAnswer.values.first else {
            return
        }
        
        questionLabel.text = currentQuestion.question
        
        aButton.setTitle("A: \(titleAButton)" , for: .normal)
        bButton.setTitle("B: \(titleBButton)" , for: .normal)
        cButton.setTitle("C: \(titleCButton)" , for: .normal)
        dButton.setTitle("D: \(titleDButton)", for: .normal)
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
        print("Заметки")
    }
    
// MARK: - Alerts
    
    func showAlertEndOfTime() {
        let alert = UIAlertController(
            title: "ВРЕМЯ ВЫШЛО",
            message: "Ваш выигрыш составил...",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ВЫЙТИ", style: .cancel, handler: { event in
            if let navigator = self.navigationController {
                navigator.popToRootViewController(animated: true)
            }
        }))
        self.present(alert, animated: true)
    }
}


extension QuestionViewController {

// MARK: - Setup Views
    
    private func setupView() {
        
        hitButtonsStackView = UIStackView(
            subviews: [fiftyButton, hallHelpButton, timerLabel, callFriendsButton, noticeButton],
            axis: .horizontal,
            spacing: 15,
            aligment: .center,
            distribution: .fillEqually
        )
        
        answerButtonStackView = UIStackView(subviews: [aButton, bButton, cButton, dButton],
                                            axis: .vertical,
                                            spacing: 10,
                                            aligment: .fill,
                                            distribution: .fillEqually)
    }
    
// MARK: - Set constraints

    private func setConstraints() {
        self.view.addSubview(mainLogo)
        self.view.addSubview(hitButtonsStackView)
        self.view.addSubview(questionNumberLabel)
        self.view.addSubview(summLabel)
        self.view.addSubview(backgroundQuestion)
        backgroundQuestion.addSubview(questionLabel)
        self.view.addSubview(answerButtonStackView)

        
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalToConstant: 158),
            mainLogo.heightAnchor.constraint(equalToConstant: 158),
            
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hitButtonsStackView.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 25),
            hitButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            hitButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            hitButtonsStackView.heightAnchor.constraint(equalToConstant: 46),
            
            questionNumberLabel.topAnchor.constraint(equalTo: hitButtonsStackView.bottomAnchor, constant: 16),
            questionNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionNumberLabel.heightAnchor.constraint(equalToConstant: 42),
            
            summLabel.topAnchor.constraint(equalTo: hitButtonsStackView.bottomAnchor, constant: 16),
            summLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            summLabel.heightAnchor.constraint(equalToConstant: 42),
            
            backgroundQuestion.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 15),
            backgroundQuestion.heightAnchor.constraint(equalToConstant: 122),
            backgroundQuestion.trailingAnchor.constraint(equalTo: hitButtonsStackView.trailingAnchor),
            backgroundQuestion.leadingAnchor.constraint(equalTo: hitButtonsStackView.leadingAnchor),
            
            questionLabel.centerYAnchor.constraint(equalTo: backgroundQuestion.centerYAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: backgroundQuestion.centerXAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 102),
            questionLabel.widthAnchor.constraint(equalToConstant: 305),
            
            answerButtonStackView.topAnchor.constraint(equalTo: backgroundQuestion.bottomAnchor, constant: 25),
            answerButtonStackView.leadingAnchor.constraint(equalTo: backgroundQuestion.leadingAnchor),
            answerButtonStackView.trailingAnchor.constraint(equalTo: backgroundQuestion.trailingAnchor),
            answerButtonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
        ])
    }
}
