import UIKit

class QuestionViewController: UIViewController {

    private var durationTimer = 30
    private var possibleError: Bool = true
    private var isRepeatedAnswerAllowed: Bool = false
    private var answeredSecondTime: Bool = false
    private var currentTitleAnswerButton: String?
    private var tagButton: Int?
    private var currentNumberQuestion = 1
    private var currentCostQuestion = 500
    private let correctAnswer = QuestionManager.shared
    
    private var gameTimer = Timer()
    private let aButton = CustomButton()
    private let bButton = CustomButton()
    private let cButton = CustomButton()
    private let dButton = CustomButton()
    
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
    private lazy var summLabel = UILabel(text: "💵 \(currentCostQuestion)₽",
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
 
//MARK: - Actions after answer did tap
    
    @objc private func answerDidTap(_ button: CustomButton) {
        button.shake()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        handleButtons()
        gameTimer.invalidate()
        tagButton = button.tag
        currentTitleAnswerButton = button.currentTitle
        
        (fiftyButton.isEnabled, hallHelpButton.isEnabled, callFriendsButton.isEnabled, noticeButton.isEnabled) = (false, false, false, false)
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(checkAnswer), userInfo: nil, repeats: false)
//        if correctAnswer.checkAnswer(buttonTag: button.tag) {
//            updateQuestion()
//        }
    }
    
    @objc func checkAnswer() {
        switch tagButton {
        case 1:
            if correctAnswer.checkAnswer(buttonTag: aButton.tag) {
                aButton.backgroundColor = .green
                updateNumberQuestion()
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goToChartViewController), userInfo: nil, repeats: false)
            } else {
                aButton.backgroundColor = .red
                if !answeredSecondTime && !possibleError{
                    startTimer()
                }
                if possibleError || (!possibleError && answeredSecondTime){
                    showAlertWrongAnswer()
                }
            }
        case 2:
            if correctAnswer.checkAnswer(buttonTag: bButton.tag) {
                bButton.backgroundColor = .green
                updateNumberQuestion()
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goToChartViewController), userInfo: nil, repeats: false)
            } else {
                bButton.backgroundColor = .red
                if !answeredSecondTime && !possibleError{
                    startTimer()
                }
                if possibleError || (!possibleError && answeredSecondTime){
                    showAlertWrongAnswer()
                }
            }
        case 3:
            if correctAnswer.checkAnswer(buttonTag: cButton.tag){
                cButton.backgroundColor = .green
                updateNumberQuestion()
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goToChartViewController), userInfo: nil, repeats: false)
            } else {
                cButton.backgroundColor = .red
                if !answeredSecondTime && !possibleError{
                    startTimer()
                }
                if possibleError || (!possibleError && answeredSecondTime){
                    showAlertWrongAnswer()
                }
            }
        case 4:
            if correctAnswer.checkAnswer(buttonTag: dButton.tag){
                dButton.backgroundColor = .green
                updateNumberQuestion()
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goToChartViewController), userInfo: nil, repeats: false)
            } else {
                dButton.backgroundColor = .red
                if !answeredSecondTime && !possibleError{
                    startTimer()
                }
                if possibleError || (!possibleError && answeredSecondTime){
                    showAlertWrongAnswer()
                }
            }
        default:
            print("Error")
        }

    }
    
    private func updateNumberQuestion() {
        print("Перенести функцию на кнопку Следующий вопрос ChartViewController")
        currentNumberQuestion += 1
        questionNumberLabel.text = "Вопрос \(currentNumberQuestion)"
        // добавить обновление цены
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
        
    private func handleButtons(){
        if possibleError {
            (aButton.isEnabled, bButton.isEnabled, cButton.isEnabled, dButton.isEnabled) = (false, false, false, false)
        } else if isRepeatedAnswerAllowed {
            (aButton.isEnabled, bButton.isEnabled, cButton.isEnabled, dButton.isEnabled) = (true, true, true, true)
            isRepeatedAnswerAllowed = false
            answeredSecondTime = false
        } else {
            (aButton.isEnabled, bButton.isEnabled, cButton.isEnabled, dButton.isEnabled) = (false, false, false, false)
            answeredSecondTime = true
        }
    }
    
    @objc func goToChartViewController() {
        if let navigator = self.navigationController {
            navigator.pushViewController(ChartViewController(), animated: true)
        }
    }

// MARK: - Help Buttons action
    
    @objc func fiftyButtonAction() {
        print("Подсказка 50/50")
        QuestionManager.shared.useFiftyHelp(1)
        
    }
    
    @objc func hallHelpButtonAction() {
            showInfoHelpHall()
            hallHelpButton.setImage(UIImage(named: ""), for: .normal)
    }
    
    func showInfoHelpHall() {
        let alert = UIAlertController(title: "Результат опроса зала",
                                      message: "Большинство зала за вариант...",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
                navigator.pushViewController(ChartViewController(), animated: true)
            }
        }))
        self.present(alert, animated: true)
    }
    
    func showAlertWrongAnswer() {
        let alert = UIAlertController(
            title: "НЕПРАВИЛЬНО",
            message: "попробуем в другой раз",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ВЫЙТИ", style: .cancel, handler: { event in
            if let navigator = self.navigationController {
                navigator.pushViewController(ChartViewController(), animated: true)
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
