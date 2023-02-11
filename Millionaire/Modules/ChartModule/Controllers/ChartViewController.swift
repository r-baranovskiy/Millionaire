import UIKit

class ChartViewController: UIViewController {
    
    private let mainLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logoLarge")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    lazy var rewardAndQuestionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .bottomColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var questionLabel = UILabel(text: "Вопрос 1", font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .left, color: .white)
    lazy var rewardLabel = UILabel(text: "100 руб", font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .right, color: .white)
    
//    lazy var ql1 = QuestionsAndRewards.shared.questionLabel
//    lazy var ql2 = QuestionsAndRewards.shared.rewardLabel

    
    lazy var fiftyHelpButton = helpButton(name: "helpIcon1", action: #selector(fiftyHelpButtonAction))
    lazy var hallHelpButton = helpButton(name: "helpIcon2", action: #selector(hallHelpButtonAction))
    lazy var friendsHelpButton = helpButton(name: "helpIcon3", action: #selector(friendsHelpButtonAction))
    lazy var mistakeHelpButton = helpButton(name: "helpIcon4", action: #selector(mistakeHelpButtonAction))
    
    lazy var labelstack1 = makeHelpView(question: "Вопрос 15", reward: "1 000 000 руб")
    lazy var labelstack2 = makeHelpView(question: "Вопрос 14", reward: "500 000 руб")
    lazy var labelstack3 = makeHelpView(question: "Вопрос 13", reward: "250 000 руб")
    lazy var labelstack4 = makeHelpView(question: "Вопрос 12", reward: "125 000 руб")
    lazy var labelstack5 = makeHelpView(question: "Вопрос 11", reward: "64 000 руб")
    lazy var labelstack6 = makeHelpView(question: "Вопрос 10", reward: "32 000 руб")
    lazy var labelstack7 = makeHelpView(question: "Вопрос 9", reward: "16 000 руб")
    lazy var labelstack8 = makeHelpView(question: "Вопрос 8", reward: "8 000 руб")
    lazy var labelstack9 = makeHelpView(question: "Вопрос 7", reward: "4 000 руб")
    lazy var labelstack10 = makeHelpView(question: "Вопрос 6", reward: "2 000 руб")
    lazy var labelstack11 = makeHelpView(question: "Вопрос 5", reward: "1 000 руб")
    lazy var labelstack12 = makeHelpView(question: "Вопрос 4", reward: "500 руб")
    lazy var labelstack13 = makeHelpView(question: "Вопрос 3", reward: "300 руб")
    lazy var labelstack14 = makeHelpView(question: "Вопрос 2", reward: "200 руб")
    lazy var labelstack15 = makeHelpView(question: "Вопрос 1", reward: "100 руб")
    lazy var firstView = makeHelpView(question: "Вопрос 1", reward: "100 руб")
    
//    lazy var exper = QuestionsAndRewards.shared.makeHelpView(question: "Вопрос 12", reward: "200 руб")
//    lazy var exper2 = QuestionsAndRewards.shared.makeHelpView(question: "Вопрос 10", reward: "300 руб")
    
    
    var helpStackOne = UIStackView()
    var helpStackTwo = UIStackView()
    var helpStack = UIStackView()
    var questionAndRewardStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorTop: .topBackgroundColor() ?? .black, colorBottom: .bottomBackgroundColor() ?? .black)
        setup()
        setupConstraints()
        
       

    }
    
    // MARK: add stack to view
    
//    func setupView(questionName: String, reward: String) -> UIView {
//        var question = UILabel(text: questionName, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .left, color: .white)
//        var reward = UILabel(text: reward, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .right, color: .white)
//        rewardAndQuestionView.addSubview(question)
//        rewardAndQuestionView.addSubview(reward)
//        return rewardAndQuestionView
//    }
    
    func setup() {
        
        self.view.addSubview(mainLogo)
        
        helpStackOne = UIStackView(subviews: [fiftyHelpButton, hallHelpButton,], axis: .horizontal, spacing: 5, aligment: .fill, distribution: .fillEqually)
        
        helpStackTwo = UIStackView(subviews: [friendsHelpButton, mistakeHelpButton], axis: .horizontal, spacing: 5, aligment: .fill, distribution: .fillEqually)
        
        helpStack = UIStackView(subviews: [helpStackOne, helpStackTwo], axis: .horizontal, spacing: 100, aligment: .fill, distribution: .fillEqually)
        self.view.addSubview(helpStack)
        
        rewardAndQuestionView.addSubview(questionLabel)
        rewardAndQuestionView.addSubview(rewardLabel)
        self.view.addSubview(rewardAndQuestionView)
//        self.view.addSubview(labelstack1)
//        self.view.addSubview(labelstack2)
//        self.view.addSubview(exper)
//
        
        
//        questionAndRewardStack = UIStackView(subviews: [labelstack1, labelstack2, labelstack3, labelstack4, labelstack5, labelstack5, labelstack6, labelstack7, labelstack7, labelstack8, labelstack9, labelstack10, labelstack11, labelstack12, labelstack13, labelstack14, labelstack15], axis: .vertical, spacing: 7, aligment: .fill, distribution: .fillEqually)
//        self.view.addSubview(questionAndRewardStack)
        
        
        
//        self.view.addSubview(firstView)
     
        
    }
    
    func makeHelpView(question: String, reward: String) -> UIView {
        var view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .bottomColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = question
        rewardLabel.text = reward
        view.addSubview(questionLabel)
        view.addSubview(rewardLabel)
        return view
    }
    
    
    func helpButton(name: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func fiftyHelpButtonAction() {
        print("Подсказка 50/50")
    }
    
    @objc func hallHelpButtonAction() {
        print("Помощь зала")
    }
    
    @objc func friendsHelpButtonAction() {
        print("Звонок другу")
    }
    
    @objc func mistakeHelpButtonAction() {
        print("Право на ошибку")
    }
    
// MARK: - Сonstraints
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.heightAnchor.constraint(equalToConstant: 70),
            mainLogo.widthAnchor.constraint(equalTo: mainLogo.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            helpStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            helpStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            helpStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            helpStack.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: rewardAndQuestionView.leadingAnchor, constant: 10),
            questionLabel.centerYAnchor.constraint(equalTo: rewardAndQuestionView.centerYAnchor),
            rewardLabel.trailingAnchor.constraint(equalTo: rewardAndQuestionView.trailingAnchor, constant: -10),
            rewardLabel.centerYAnchor.constraint(equalTo: rewardAndQuestionView.centerYAnchor)

        ])
        
        NSLayoutConstraint.activate([
            rewardAndQuestionView.topAnchor.constraint(equalTo: helpStack.bottomAnchor, constant: 20),
            rewardAndQuestionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            rewardAndQuestionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rewardAndQuestionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
//        NSLayoutConstraint.activate([
//            labelstack1.topAnchor.constraint(equalTo: rewardAndQuestionView.bottomAnchor, constant: 20),
//            labelstack1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            labelstack1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            labelstack1.heightAnchor.constraint(equalToConstant: 50)
//        ])
//
        
        
        
        
//        NSLayoutConstraint.activate([
//            exper.topAnchor.constraint(equalTo: helpStack.bottomAnchor, constant: 100),
//            exper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            exper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            exper.heightAnchor.constraint(equalToConstant: 50)
//        ])
        

        
//        NSLayoutConstraint.activate([
//            ql1.leadingAnchor.constraint(equalTo: super..leadingAnchor, constant: 10),
//            ql1.centerYAnchor.constraint(equalTo: exper.centerYAnchor),
//            ql2.trailingAnchor.constraint(equalTo: exper.trailingAnchor, constant: -10),
//            ql2.centerYAnchor.constraint(equalTo: exper.centerYAnchor)
//
//        ])
        
        
        
        
        

        
        
        
//        NSLayoutConstraint.activate([
//            questionAndRewardStack.topAnchor.constraint(equalTo: helpStack.bottomAnchor, constant: 30),
//            questionAndRewardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            questionAndRewardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            questionAndRewardStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
//        ])
    }
    
}
