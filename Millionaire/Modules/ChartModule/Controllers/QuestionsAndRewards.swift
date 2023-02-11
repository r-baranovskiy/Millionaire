import UIKit

struct QuestionsAndRewards {
    static var shared = QuestionsAndRewards()
    let questions: [String] = ["Вопрос 15", "Вопрос 14", "Вопрос 13", "Вопрос 12", "Вопрос 11", "Вопрос 10", "Вопрос 9", "Вопрос 8", "Вопрос 7", "Вопрос 6", "Вопрос 5", "Вопрос 4", "Вопрос 3", "Вопрос 2","Вопрос 1"]
    
    let answers: [String] = ["1.000.000 руб", "500.000 руб", "250.000 руб", "125.000 руб", "64.000 руб", "32.000 руб", "16.000 руб", "8.000 руб", "4.000 руб", "2.000 руб", "1.000 руб", "500 руб", "300 руб", "200 руб", "100 руб"]
    
    lazy var questionLabel = UILabel(text: "", font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .left, color: .white)
    lazy var rewardLabel = UILabel(text: "", font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .right, color: .white)
    
    mutating func makeHelpView(question: String, reward: String) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .bottomColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = question
        rewardLabel.text = reward
        view.addSubview(questionLabel)
        view.addSubview(rewardLabel)
        return view
    }
    
    
    
}
