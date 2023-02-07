import Foundation

struct QuestionBase {
    
    static let shared = QuestionBase()
    
    private let lowQuestions: [Question] = [
        Question(
            question: "Выбери число 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "15"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "Выбери число 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "4"],
                cAnswer: [false : "15"], dAnswer: [false : "30"])),
        Question(
            question: "Выбери число 3",
            answers: Answer(
                aAnswer: [false : "313"], bAnswer: [false : "91"],
                cAnswer: [false : "1"], dAnswer: [true : "3"])),
        Question(
            question: "Выбери число 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "18"],
                cAnswer: [true : "4"], dAnswer: [false : "1337"])),
        Question(
            question: "Выбери число 5",
            answers: Answer(
                aAnswer: [true : "90"], bAnswer: [true : "5"],
                cAnswer: [false : "4"], dAnswer: [false : "55"]))
    ]
    
    private let mediumQuestions: [Question] = [
        Question(
            question: "MEDIUM Выбери число 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "15"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "MEDIUM Выбери число 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "4"],
                cAnswer: [false : "15"], dAnswer: [false : "30"])),
        Question(
            question: "MEDIUM Выбери число 3",
            answers: Answer(
                aAnswer: [false : "313"], bAnswer: [false : "91"],
                cAnswer: [false : "1"], dAnswer: [true : "3"])),
        Question(
            question: "MEDIUM Выбери число 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "18"],
                cAnswer: [true : "4"], dAnswer: [false : "1337"])),
        Question(
            question: "MEDIUM Выбери число 5",
            answers: Answer(
                aAnswer: [true : "90"], bAnswer: [true : "5"],
                cAnswer: [false : "4"], dAnswer: [false : "55"]))
    ]
    
    private let hardQuestions: [Question] = [
        Question(
            question: "HARD Выбери число 1",
            answers: Answer(
                aAnswer: [false : "4"], bAnswer: [false : "15"],
                cAnswer: [true : "1"], dAnswer: [false : "3"])),
        Question(
            question: "HARD Выбери число 2",
            answers: Answer(
                aAnswer: [true : "2"], bAnswer: [false : "4"],
                cAnswer: [false : "15"], dAnswer: [false : "30"])),
        Question(
            question: "HARD Выбери число 3",
            answers: Answer(
                aAnswer: [false : "313"], bAnswer: [false : "91"],
                cAnswer: [false : "1"], dAnswer: [true : "3"])),
        Question(
            question: "HARD Выбери число 4",
            answers: Answer(
                aAnswer: [false : "2"], bAnswer: [false : "18"],
                cAnswer: [true : "4"], dAnswer: [false : "1337"])),
        Question(
            question: "HARD Выбери число 5",
            answers: Answer(
                aAnswer: [true : "90"], bAnswer: [true : "5"],
                cAnswer: [false : "4"], dAnswer: [false : "55"]))
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
