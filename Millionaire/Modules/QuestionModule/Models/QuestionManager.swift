import Foundation

/// Data Manager to fetch any questions from QuestionDataBase
final class QuestionManager {
    
    let totalQuestions: Int
    
    init(totalQuestions: Int) {
        self.totalQuestions = totalQuestions
    }
    
    private let lowQuestions = QuestionDataBase.shared.fetchRandomLowQuestions()
    private let mediumQuestions = QuestionDataBase.shared.fetchRandomMediumQuestions()
    private let hardQuestions = QuestionDataBase.shared.fetchRandomHardQuestions()

    var currentQuestionIndex = 0
    var currentNumberAnswer = 1
    var currentTypeQuestion: QuestionType = .low
    
    func testArrays() {
        print(lowQuestions)
        print(mediumQuestions)
        print(hardQuestions)
    }

    func fetchNewQuestion() -> Question? {
        let totalForEach = totalQuestions / 3
        
        if totalQuestions % 3 != 0 {
            return nil
        }
        
        if lowQuestions.count < totalForEach || mediumQuestions.count < totalForEach || hardQuestions.count < totalForEach {
            return nil
        }

        switch currentTypeQuestion {
        case .low:
            if currentQuestionIndex < totalForEach {
                return lowQuestions[currentQuestionIndex]
            } else {
                currentTypeQuestion = .medium
                currentQuestionIndex = 0
            }
            currentQuestionIndex += 1
        case .medium:
            if currentQuestionIndex < totalForEach {
                return mediumQuestions[currentQuestionIndex]
            } else {
                currentTypeQuestion = .hard
                currentQuestionIndex = 0
            }
            currentQuestionIndex += 1
        case .hard:
            if currentQuestionIndex < totalForEach {
                return hardQuestions[currentQuestionIndex]
            } else {
                currentQuestionIndex = 0
                return nil
            }
        }
        return nil
    }
}
