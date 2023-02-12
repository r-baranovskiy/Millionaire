import Foundation

/// Data Manager to fetch any questions from QuestionDataBase
final class QuestionManager {
    
    static let shared = QuestionManager()
    
    enum HelpType {
        case fifty
        case hall
        case possibleError
    }
    
    var isTheFirstGame = true
    var currentTotalSum = 0
    var currentUsername: String = "Guest"
    
    private var lowQuestions = QuestionDataBase.shared.fetchRandomLowQuestions()
    private var mediumQuestions = QuestionDataBase.shared.fetchRandomMediumQuestions()
    private var hardQuestions = QuestionDataBase.shared.fetchRandomHardQuestions()
    
    private (set) var currentQuestion: Question?
    private (set) var currentNumberQuestion = 0
    private (set) var currentQuestionCost = 100
    
    private let totalQuestions = 15
    private let countOfAnswersInQuestion = 4
    private var currentQuestionIndex = 0
    
    private var currentTypeQuestion: QuestionType = .low
    
    //States for help buttons
    private (set) var isFiftyEnabled: Bool = true
    private (set) var isHallEnabled: Bool = true
    private (set) var isPossibleErrorEnebled: Bool = true
    
    func newGame() {
        lowQuestions = QuestionDataBase.shared.fetchRandomLowQuestions()
        mediumQuestions = QuestionDataBase.shared.fetchRandomMediumQuestions()
        hardQuestions = QuestionDataBase.shared.fetchRandomHardQuestions()
        
        currentNumberQuestion = 0
        currentQuestionCost = 100
        currentQuestionIndex = 0
        currentTypeQuestion = .low
        isHallEnabled = true
        isHallEnabled = true
        isPossibleErrorEnebled = true
        
        if currentTotalSum > 100 {
            let score = ScoreModel(name: currentUsername, sum: currentTotalSum)
            ScoreManager.shared.create(score: score)
        }
        currentTotalSum = 0
    }
    
    // MARK: - Help
    
    func userHelp(typeOfHelp: HelpType) {
        switch typeOfHelp {
        case .fifty:
            useFiftyHelp()
        case .hall:
            useHallHelp()
        case .possibleError:
            usePossibleError()
        }
    }
    
    // Func to use callToFriend help
    private func usePossibleError() {
        guard let currentQuestion = currentQuestion,
              isPossibleErrorEnebled else {
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
        isPossibleErrorEnebled = false
    }
    
    // Func to use hall help
    private func useHallHelp() {
        isHallEnabled = false
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
    func checkAnswer() -> Int {
        if currentQuestion?.answers.aAnswer[true] != nil {
            return 1
        } else if currentQuestion?.answers.bAnswer[true] != nil {
            return 2
        } else if currentQuestion?.answers.cAnswer[true] != nil {
            return 3
        } else {
            return 4
        }
    }
    
    //
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
            currentTotalSum = 1000
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
            currentTotalSum = 32_000
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
