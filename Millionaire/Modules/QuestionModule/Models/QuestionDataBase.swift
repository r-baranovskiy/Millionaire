import Foundation

/// Question data base that containts all the questions in the project
struct QuestionDataBase {
    
    static let shared = QuestionDataBase()
    
    private let lowQuestions: [Question] = [
        Question(
            question: "LOW 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "5"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "LOW 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "1"],
                cAnswer: [false : "4"], dAnswer: [false : "3"])),
        Question(
            question: "LOW 3",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "1"],
                cAnswer: [false : "2"], dAnswer: [true : "3"])),
        Question(
            question: "LOW 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "3"],
                cAnswer: [true : "4"], dAnswer: [false : "1"])),
        Question(
            question: "LOW 5",
            answers: Answer(
                aAnswer: [true : "1"], bAnswer: [true : "5"],
                cAnswer: [false : "2"], dAnswer: [false : "3"])),
        Question(
            question: "LOW 6",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "7"],
                cAnswer: [true : "6"], dAnswer: [false : "9"])),
        Question(
            question: "LOW 7",
            answers: Answer(
                aAnswer: [true : "7"], bAnswer: [false : "8"],
                cAnswer: [false : "6"], dAnswer: [false : "9"])),
        Question(
            question: "LOW 8",
            answers: Answer(
                aAnswer: [false : "9"], bAnswer: [false : "7"],
                cAnswer: [false : "6"], dAnswer: [true : "8"])),
        Question(
            question: "LOW 9",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "6"],
                cAnswer: [true : "9"], dAnswer: [false : "7"])),
    ]
    
    private let mediumQuestions: [Question] = [
        Question(
            question: "MEDIUM 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "5"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "MEDIUM 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "1"],
                cAnswer: [false : "4"], dAnswer: [false : "3"])),
        Question(
            question: "MEDIUM 3",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "1"],
                cAnswer: [false : "2"], dAnswer: [true : "3"])),
        Question(
            question: "MEDIUM 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "3"],
                cAnswer: [true : "4"], dAnswer: [false : "1"])),
        Question(
            question: "MEDIUM 5",
            answers: Answer(
                aAnswer: [true : "1"], bAnswer: [true : "5"],
                cAnswer: [false : "2"], dAnswer: [false : "3"])),
        Question(
            question: "MEDIUM 6",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "7"],
                cAnswer: [true : "6"], dAnswer: [false : "9"])),
        Question(
            question: "MEDIUM 7",
            answers: Answer(
                aAnswer: [true : "7"], bAnswer: [false : "8"],
                cAnswer: [false : "6"], dAnswer: [false : "9"])),
        Question(
            question: "MEDIUM 8",
            answers: Answer(
                aAnswer: [false : "9"], bAnswer: [false : "7"],
                cAnswer: [false : "6"], dAnswer: [true : "8"])),
        Question(
            question: "MEDIUM 9",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "6"],
                cAnswer: [true : "9"], dAnswer: [false : "7"])),
    ]
    
    private let hardQuestions: [Question] = [
        Question(
            question: "HARD 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "5"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "HARD 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "1"],
                cAnswer: [false : "4"], dAnswer: [false : "3"])),
        Question(
            question: "HARD 3",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "1"],
                cAnswer: [false : "2"], dAnswer: [true : "3"])),
        Question(
            question: "HARD 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "3"],
                cAnswer: [true : "4"], dAnswer: [false : "1"])),
        Question(
            question: "HARD 5",
            answers: Answer(
                aAnswer: [true : "1"], bAnswer: [true : "5"],
                cAnswer: [false : "2"], dAnswer: [false : "3"])),
        Question(
            question: "HARD 6",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "7"],
                cAnswer: [true : "6"], dAnswer: [false : "9"])),
        Question(
            question: "HARD 7",
            answers: Answer(
                aAnswer: [true : "7"], bAnswer: [false : "8"],
                cAnswer: [false : "6"], dAnswer: [false : "9"])),
        Question(
            question: "HARD 8",
            answers: Answer(
                aAnswer: [false : "9"], bAnswer: [false : "7"],
                cAnswer: [false : "6"], dAnswer: [true : "8"])),
        Question(
            question: "HARD 9",
            answers: Answer(
                aAnswer: [false : "8"], bAnswer: [false : "6"],
                cAnswer: [true : "9"], dAnswer: [false : "7"])),
    ]
    
    func fetchRandomLowQuestions() -> [Question] {
        lowQuestions.shuffled()
    }
    
    func fetchRandomMediumQuestions() -> [Question] {
        mediumQuestions.shuffled()
    }
    
    func fetchRandomHardQuestions() -> [Question] {
        hardQuestions.shuffled()
    }
    
}
