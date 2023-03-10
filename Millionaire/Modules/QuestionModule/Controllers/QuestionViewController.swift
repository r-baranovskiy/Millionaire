import UIKit

class QuestionViewController: UIViewController {
    
    private var durationTimer = 30
    private var possibleError: Bool = true
    private var answeredSecondTime: Bool = false
    private var isRepeatedAnswerAllowed: Bool = false
    private var currentTitleAnswerButton: String?
    private let questionManager = QuestionManager.shared
    private let soundManager = SoundManager.shared
    
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
    
    private let timerLabel = UILabel(
        text: "⏱️ 30", font: .systemFont(ofSize: 28, weight: .semibold),
        textAlignment: .center, color: .white)
    private lazy var questionNumberLabel = UILabel(
        text: "Вопрос \(questionManager.currentNumberQuestion)",
        font: .systemFont(ofSize: 28, weight: .semibold),
        textAlignment: .center, color: .white)
    private lazy var questionCostLabel = UILabel(
        text: "💵 \(questionManager.currentQuestionCost)₽",
        font: .systemFont(ofSize: 22, weight: .semibold),
        textAlignment: .left, color: .white)
    private lazy var questionLabel = UILabel(
        text: "Здесь отображается вопрос",
        font: .systemFont(ofSize: 16, weight: .regular),
        textAlignment: .center, color: .white)
    
    private lazy var backgroundQuestion: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .bottomColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func helpButton(name: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private lazy var fiftyButton = helpButton(
        name: "helpIcon1", action: #selector(fiftyButtonAction))
    private lazy var hallHelpButton = helpButton(
        name: "helpIcon2", action: #selector(hallHelpButtonAction))
    private lazy var possibleErrorButton = helpButton(
        name: "helpIcon3", action: #selector(possibleErrorButtonAction))
    private lazy var noticeButton = helpButton(
        name: "helpIcon4", action: #selector(noticeButtonAction))
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(
            colorTop: .topBackgroundColor() ?? .black,
            colorBottom: .bottomBackgroundColor() ?? .black)
        startGame()
        loadMainLogo()
    }
    
    private func startGame() {
        soundManager.playSound(sound: .startGame)
        let time = (questionManager.isTheFirstGame ? soundManager.soundDuration : 0) ?? 5
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { _ in
            self.soundManager.playSound(sound: .startGame)
            self.setButtontargets()
            self.startTimer()
            self.updateQuestion()
            self.updateStateButtons()
            self.setupView()
            self.setConstraints()
            self.questionManager.isTheFirstGame = false
            self.soundManager.playSound(sound: .timerGame)
        }
    }
    
    // MARK: - Timer
    
    private func startTimer() {
        gameTimer = Timer.scheduledTimer(
            timeInterval: 1, target: self, selector: (#selector(updateTimer)),
            userInfo: nil, repeats: true)
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
    
    //MARK: - Buttons Behaviour
    
    @objc private func answerDidTap(_ button: CustomButton) {
        button.shake()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        handleButtons()
        gameTimer.invalidate()
        currentTitleAnswerButton = button.currentTitle
        soundManager.playSound(sound: .asnwerDidSelected)
        (fiftyButton.isEnabled, hallHelpButton.isEnabled,
         possibleErrorButton.isEnabled, noticeButton.isEnabled) = (
            false, false, false, false)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.checkAnswer(button: button)
        }
    }
    
    @objc func checkAnswer(button: UIButton) {
        let tagOfRightButton = questionManager.checkAnswer()
        
        var isRight = Bool()
        
        if tagOfRightButton == button.tag {
            isRight = true
            button.backgroundColor = .green
        }
        
        if isRight {
            updateInfoQuestion()
            soundManager.playSound(sound: .rightAnswer)
            goToChartViewController()
        } else {
            button.backgroundColor = .red
            if !answeredSecondTime && !possibleError {
                startTimer()
            }
            if possibleError || (!possibleError && answeredSecondTime){
                soundManager.playSound(sound: .failAnswer)
                endGame()
            }
        }
    }
    
    private func endGame() {
        questionManager.saveIfLoseGame()
        let loseVC = LoseViewController()
        navigationController?.pushViewController(loseVC, animated: false)
    }
    
    // MARK: - Appearance
    
    private func setButtontargets() {
        aButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        cButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        dButton.addTarget(self, action: #selector(answerDidTap), for: .touchUpInside)
        
        aButton.tag = 1
        bButton.tag = 2
        cButton.tag = 3
        dButton.tag = 4
    }
    
    private func updateInfoQuestion() {
        questionNumberLabel.text = "Вопрос \(questionManager.currentNumberQuestion)"
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
    
    private func updateStateButtons() {
        fiftyButton.isEnabled = questionManager.isFiftyEnabled
        possibleErrorButton.isEnabled = questionManager.isPossibleErrorEnebled
        hallHelpButton.isEnabled = questionManager.isHallEnabled
    }
    
    private func handleButtons(){
        if possibleError {
            (aButton.isEnabled, bButton.isEnabled,
             cButton.isEnabled, dButton.isEnabled) = (false, false, false, false)
        } else if isRepeatedAnswerAllowed {
            (aButton.isEnabled, bButton.isEnabled, cButton.isEnabled,
             dButton.isEnabled) = (true, true, true, true)
            isRepeatedAnswerAllowed = false
            answeredSecondTime = false
        } else {
            (aButton.isEnabled, bButton.isEnabled,
             cButton.isEnabled, dButton.isEnabled) = (false, false, false, false)
            answeredSecondTime = true
        }
    }
    
    @objc func goToChartViewController() {
        let chartVC = ChartViewController()
        chartVC.numberOfQuestion = questionManager.currentNumberQuestion
        navigationController?.pushViewController(chartVC, animated: true)
    }
    
    // MARK: - Help Buttons action
    
    @objc func fiftyButtonAction() {
        let array = questionManager.useFiftyHelp()
        soundManager.playHelpSound(helpSound: .fiftyHelpSound)
        if let fiftyTags = array?.shuffled().dropLast() {
            for fiftyTag in fiftyTags {
                switch fiftyTag {
                case 1:
                    aButton.setTitle("", for: .normal)
                case 2:
                    bButton.setTitle("", for: .normal)
                case 3:
                    cButton.setTitle("", for: .normal)
                case 4:
                    dButton.setTitle("", for: .normal)
                default:
                    break
                }
            }
        }
        updateStateButtons()
    }
    
    @objc func hallHelpButtonAction() {
        soundManager.playHelpSound(helpSound: .hallHelpSound)
        questionManager.userHelp(typeOfHelp: .hall)
        let tagOfRightButton = questionManager.checkAnswer()
        
        if tagOfRightButton == aButton.tag {
            aButton.buttonUnpressed()
        } else if tagOfRightButton == bButton.tag {
            bButton.buttonUnpressed()
        } else if tagOfRightButton == cButton.tag {
            cButton.buttonUnpressed()
        } else if tagOfRightButton == dButton.tag {
            dButton.buttonUnpressed()
        }
        updateStateButtons()
    }
    
    @objc func possibleErrorButtonAction() {
        soundManager.playHelpSound(helpSound: .possibleErrorSound)
        questionManager.userHelp(typeOfHelp: .possibleError)
        if possibleError {
            possibleError = false
            isRepeatedAnswerAllowed = true
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.updateStateButtons()
        }
    }
    
    @objc func noticeButtonAction() {
        
        let alert = UIAlertController(
            title: "Забрать деньги?",
            message: "Вы уверены, что хотите забрать деньги?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            QuestionManager.shared.safeMoney()
            self.questionManager.newGame()
            self.navigationController?.popToRootViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    // MARK: - Alerts
    
    func showAlertEndOfTime() {
        let alert = UIAlertController(
            title: "ВРЕМЯ ВЫШЛО",
            message: "Ваш выигрыш составил \(questionManager.currentQuestionCost)",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ВЫЙТИ", style: .cancel, handler: { event in
            self.endGame()
        }))
        self.present(alert, animated: true)
    }
}

extension QuestionViewController {
    
    // MARK: - Setup Views
    
    private func setupView() {
        hitButtonsStackView = UIStackView(
            subviews: [fiftyButton, hallHelpButton, timerLabel, possibleErrorButton, noticeButton],
            axis: .horizontal, spacing: 15, aligment: .center, distribution: .fillEqually
        )
        
        answerButtonStackView = UIStackView(
            subviews: [aButton, bButton, cButton, dButton],
            axis: .vertical, spacing: 10, aligment: .fill, distribution: .fillEqually)
    }
    
    // MARK: - Set constraints
    
    private func loadMainLogo() {
        view.addSubview(mainLogo)
        mainLogo.alpha = 0
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalToConstant: 158),
            mainLogo.heightAnchor.constraint(equalToConstant: 158),
        ])
        let time = (questionManager.isTheFirstGame ? soundManager.soundDuration : 0) ?? 5
        UIView.animate(withDuration: time) {
            self.mainLogo.alpha = 1
        }
    }
    
    private func setConstraints() {
        self.view.addSubview(hitButtonsStackView)
        self.view.addSubview(questionNumberLabel)
        self.view.addSubview(questionCostLabel)
        self.view.addSubview(backgroundQuestion)
        backgroundQuestion.addSubview(questionLabel)
        self.view.addSubview(answerButtonStackView)
        
        NSLayoutConstraint.activate([
            
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hitButtonsStackView.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 25),
            hitButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            hitButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            hitButtonsStackView.heightAnchor.constraint(equalToConstant: 46),
            
            questionNumberLabel.topAnchor.constraint(equalTo: hitButtonsStackView.bottomAnchor, constant: 16),
            questionNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionNumberLabel.heightAnchor.constraint(equalToConstant: 42),
            
            questionCostLabel.topAnchor.constraint(equalTo: hitButtonsStackView.bottomAnchor, constant: 16),
            questionCostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            questionCostLabel.heightAnchor.constraint(equalToConstant: 42),
            
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
