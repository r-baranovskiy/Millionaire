import Foundation

struct Question {
    let question: String
    let answers: Answer
}

struct Answer {
    let aAnswer: [Bool: String]
    let bAnswer: [Bool: String]
    let cAnswer: [Bool: String]
    let dAnswer: [Bool: String]
}

enum QuestionType {
    case low
    case medium
    case hard
}
