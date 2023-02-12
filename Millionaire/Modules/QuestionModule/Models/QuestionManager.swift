import Foundation

/// Data Manager to fetch any questions from QuestionDataBase
final class QuestionManager {
    
    static let shared = QuestionManager()
    
    enum HelpType {
        case fifty
        case hall
        case callToFriend
    }
    
    var isTheFirstGame = true
    private (set) var currentQuestion: Question?
    private (set) var currentNumberQuestion = 0
    private (set) var currentQuestionCost = 100
    
    //States for help buttons
    private (set) var isFiftyEnabled: Bool = true
    private (set) var isHallEnabled: Bool = true
    private (set) var isCallToFriendEnebled: Bool = true
    
    private let totalQuestions = 15
    private let countOfAnswersInQuestion = 4
    
    private let lowQuestions = QuestionDataBase.shared.fetchRandomLowQuestions()
    private let mediumQuestions = QuestionDataBase.shared.fetchRandomMediumQuestions()
    private let hardQuestions = QuestionDataBase.shared.fetchRandomHardQuestions()
    
    private var currentQuestionIndex = 0
    private var currentTypeQuestion: QuestionType = .low
    
    // MARK: - Help
    
    func userHelp(typeOfHelp: HelpType) {
        switch typeOfHelp {
        case .fifty:
            useFiftyHelp()
        case .hall:
            useHallHelp()
        case .callToFriend:
            useCallToFriend()
        }
    }
    
    // Func to use callToFriend help
    private func useCallToFriend() {
        guard let currentQuestion = currentQuestion,
        isCallToFriendEnebled else {
            return
        }
        
        var answers: [[Bool:String]] = []
        
        let currentAnswers = [currentQuestion.answers.aAnswer, currentQuestion.answers.bAnswer,
                              currentQuestion.answers.cAnswer, currentQuestion.answers.dAnswer].shuffled()
        
        for answer in currentAnswers {
            if answer[true] != nil {
                answers.append(answer)
            } else {
                while answers.count < countOfAnswersInQuestion / 2 {
                    answers.append(answer)
                }
            }
        }
        isCallToFriendEnebled = false
    }
    
    // Func to use hall help
    private func useHallHelp() -> [Bool: String]? {
        guard let currentQuestion = currentQuestion,
        isHallEnabled else {
            return nil
        }
        
        var rightAnswer = [Bool: String]()
        
        let currentAnswers = [currentQuestion.answers.aAnswer, currentQuestion.answers.bAnswer,
                              currentQuestion.answers.cAnswer, currentQuestion.answers.dAnswer]
        
        for answer in currentAnswers {
            if answer[true] != nil {
                rightAnswer = answer
            }
        }
        isHallEnabled = false
        return rightAnswer
    }
    
    // Func to use 50 percent help
    private func useFiftyHelp() {
        guard let currentQuestion = currentQuestion,
        isFiftyEnabled else {
            return
        }
        var answers: [[Bool:String]] = []
        
        let currentAnswers = [currentQuestion.answers.aAnswer, currentQuestion.answers.bAnswer,
                              currentQuestion.answers.cAnswer, currentQuestion.answers.dAnswer].shuffled()
        
        for answer in currentAnswers {
            if answer[true] != nil {
                answers.append(answer)
            } else {
                while answers.count < countOfAnswersInQuestion / 2 {
                    answers.append(answer)
                }
            }
        }
        isFiftyEnabled = false
    }
    
    // MARK: - Questions
    
    // Func to fetch new request for different levels
    func fetchNewQuestion() -> Question? {
        updateCurrentQuestion()
        return currentQuestion
    }
    
    // Func to check on the right answer
    func checkAnswer(buttonTag: Int) -> Bool {
        switch buttonTag {
        case 1:
            print(currentQuestion?.answers.aAnswer[true] != nil ? true : false)
            return currentQuestion?.answers.aAnswer[true] != nil ? true : false
        case 2:
            print(currentQuestion?.answers.bAnswer[true] != nil ? true : false)
            return currentQuestion?.answers.bAnswer[true] != nil ? true : false
        case 3:
            print(currentQuestion?.answers.cAnswer[true] != nil ? true : false)
            return currentQuestion?.answers.cAnswer[true] != nil ? true : false
        case 4:
            print(currentQuestion?.answers.dAnswer[true] != nil ? true : false)
            return currentQuestion?.answers.dAnswer[true] != nil ? true : false
        default:
            return false
        }
    }
    
    private func updateCurrentQuestionCost(numberOrQuestion: Int) {
        switch numberOrQuestion {
        case 1:
            currentQuestionCost = 100
        case 2:
            currentQuestionCost = 200
        case 3:
            currentQuestionCost = 300
        case 4:
            currentQuestionCost = 500
        case 5:
            currentQuestionCost = 1000
        case 6:
            currentQuestionCost = 2000
        case 7:
            currentQuestionCost = 4000
        case 8:
            currentQuestionCost = 8000
        case 9:
            currentQuestionCost = 16_000
        case 10:
            currentQuestionCost = 32_000
        case 11:
            currentQuestionCost = 64_000
        case 12:
            currentQuestionCost = 125_000
        case 13:
            currentQuestionCost = 250_000
        case 14:
            currentQuestionCost = 500_000
        case 15:
            currentQuestionCost = 1_000_000
        default:
            currentQuestionCost = 0
        }
    }
    
    // Private func to generate random quesion
    private func updateCurrentQuestion() {
        let totalForEach = totalQuestions / 3
        
        if totalQuestions % 3 != 0 {
            return
        }
        
        if lowQuestions.count < totalForEach || mediumQuestions.count < totalForEach || hardQuestions.count < totalForEach {
            return
        }
        
        currentNumberQuestion += 1
        
        updateCurrentQuestionCost(numberOrQuestion: currentNumberQuestion)
        
        switch currentTypeQuestion {
        case .low:
            if currentQuestionIndex < totalForEach {
                currentQuestion = lowQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            } else {
                currentTypeQuestion = .medium
                currentQuestionIndex = 0
                currentQuestion = mediumQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        case .medium:
            if currentQuestionIndex < totalForEach {
                currentQuestion = mediumQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            } else {
                currentTypeQuestion = .hard
                currentQuestionIndex = 0
                currentQuestion = hardQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        case .hard:
            if currentQuestionIndex < totalForEach {
                currentQuestion = hardQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        }
    }
}
