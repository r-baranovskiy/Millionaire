import UIKit

final class ChartViewController: UIViewController {
    
    var numberOfQuestion = 0
    
    private let mainLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logoLarge")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    lazy var fiftyHelpButton = helpButton(name: "helpIcon21")
    lazy var hallHelpButton = helpButton(name: "helpIcon2")
    lazy var friendsHelpButton = helpButton(name: "helpIcon3")
    lazy var mistakeHelpButton = helpButton(name: "helpIcon4")
    
    var helpStackOne = UIStackView()
    var helpStackTwo = UIStackView()
    var helpStack = UIStackView()
    var questionAndRewardStack = UIStackView()
    
    lazy var view15 = setUpQuestionView(
        titleQuestion: "Вопрос 15", sumOfQuestion: "1.000.000 руб.", alpha: 1.0)
    lazy var view14 = setUpQuestionView(
        titleQuestion: "Вопрос 14", sumOfQuestion: "500.000 руб.")
    lazy var view13 = setUpQuestionView(
        titleQuestion: "Вопрос 13", sumOfQuestion: "250.000 руб.")
    lazy var view12 = setUpQuestionView(
        titleQuestion: "Вопрос 12", sumOfQuestion: "125.000 руб.")
    lazy var view11 = setUpQuestionView(
        titleQuestion: "Вопрос 11", sumOfQuestion: "64.000 руб.")
    lazy var view10 = setUpQuestionView(
        titleQuestion: "Вопрос 10", sumOfQuestion: "32.000 руб.", alpha: 1.0)
    lazy var view9 = setUpQuestionView(
        titleQuestion: "Вопрос 9", sumOfQuestion: "16.000 руб.")
    lazy var view8 = setUpQuestionView(
        titleQuestion: "Вопрос 8", sumOfQuestion: "8.000 руб.")
    lazy var view7 = setUpQuestionView(
        titleQuestion: "Вопрос 7", sumOfQuestion: "4.000 руб.")
    lazy var view6 = setUpQuestionView(
        titleQuestion: "Вопрос 6", sumOfQuestion: "2.000 руб.")
    lazy var view5 = setUpQuestionView(
        titleQuestion: "Вопрос 5", sumOfQuestion: "1.000 руб.", alpha: 1.0)
    lazy var view4 = setUpQuestionView(
        titleQuestion: "Вопрос 4", sumOfQuestion: "500 руб.")
    lazy var view3 = setUpQuestionView(
        titleQuestion: "Вопрос 3", sumOfQuestion: "300 руб.")
    lazy var view2 = setUpQuestionView(
        titleQuestion: "Вопрос 2", sumOfQuestion: "200 руб.")
    lazy var view1 = setUpQuestionView(
        titleQuestion: "Вопрос 1", sumOfQuestion: "100 руб.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(
            colorTop: .topBackgroundColor() ?? .black,
            colorBottom: .bottomBackgroundColor() ?? .black)
        setup()
        updateUI(numberOfQuestion: numberOfQuestion)
        goBack()
        setupConstraints()
    }
    
    private func setUpQuestionView(titleQuestion: String, sumOfQuestion: String,
                                   alpha: CGFloat = 0.6) -> UIView {
        let questionView = UIView()
        questionView.translatesAutoresizingMaskIntoConstraints = false
        
        let questionLabel = UILabel(
            text: titleQuestion, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .left, color: .white)
        let rewardLabel = UILabel(
            text: sumOfQuestion, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .right, color: .white)
        let stack = UIStackView(
            subviews: [questionLabel, rewardLabel], axis: .horizontal, spacing: 0, aligment: .fill, distribution: .fillEqually)
        
        questionView.addSubview(stack)
        questionView.alpha = alpha
        questionView.backgroundColor = .bottomColor()
        questionView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: questionView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: questionView.trailingAnchor, constant: -20)
        ])
        
        return questionView
    }
    
    // MARK: add stack to view
    
    private func setup() {
        
        self.view.addSubview(mainLogo)
        
        helpStackOne = UIStackView(
            subviews: [fiftyHelpButton, hallHelpButton,],
            axis: .horizontal, spacing: 5,
            aligment: .fill, distribution: .fillEqually)
        
        helpStackTwo = UIStackView(
            subviews: [friendsHelpButton, mistakeHelpButton],
            axis: .horizontal, spacing: 5,
            aligment: .fill, distribution: .fillEqually)
        
        helpStack = UIStackView(
            subviews: [helpStackOne, helpStackTwo],
            axis: .horizontal, spacing: 100,
            aligment: .fill, distribution: .fillEqually)
        self.view.addSubview(helpStack)
        
        questionAndRewardStack = UIStackView(
            subviews: [view15, view14, view13, view12, view11, view10, view9,
                       view8, view7, view6, view5, view4, view3, view2, view1],
            axis: .vertical, spacing: 7, aligment: .fill, distribution: .fillEqually)
        self.view.addSubview(questionAndRewardStack)
    }
    
    private func goBack() {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            let previousVC = QuestionViewController()
            self.navigationController?.pushViewController(previousVC, animated: false)
        }
    }
    
    // MARK: - Appearance
    
    private func updateUI(numberOfQuestion: Int) {
        switch numberOfQuestion {
        case 1:
            view1.backgroundColor = .green
            view1.alpha = 1
        case 2:
            view2.backgroundColor = .green
            view2.alpha = 1
        case 3:
            view3.backgroundColor = .green
            view3.alpha = 1
        case 4:
            view4.backgroundColor = .green
            view4.alpha = 1
        case 5:
            view5.backgroundColor = .green
            view5.alpha = 1
        case 6:
            view6.backgroundColor = .green
            view6.alpha = 1
        case 7:
            view7.backgroundColor = .green
            view7.alpha = 1
        case 8:
            view8.backgroundColor = .green
            view8.alpha = 1
        case 9:
            view9.backgroundColor = .green
            view9.alpha = 1
        case 10:
            view10.backgroundColor = .green
            view10.alpha = 1
        case 11:
            view11.backgroundColor = .green
            view11.alpha = 1
        case 12:
            view12.backgroundColor = .green
            view12.alpha = 1
        case 13:
            view13.backgroundColor = .green
            view13.alpha = 1
        case 14:
            view14.backgroundColor = .green
            view14.alpha = 1
        case 15:
            view15.backgroundColor = .green
            view15.alpha = 1
        default:
            break
        }
    }
    
    private func helpButton(name: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func naviButton(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Сonstraints
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.heightAnchor.constraint(equalToConstant: 70),
            mainLogo.widthAnchor.constraint(equalTo: mainLogo.heightAnchor),
            
            helpStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            helpStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            helpStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            helpStack.heightAnchor.constraint(equalToConstant: 50),
            
            questionAndRewardStack.topAnchor.constraint(equalTo: helpStack.bottomAnchor, constant: 30),
            questionAndRewardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            questionAndRewardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            questionAndRewardStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
