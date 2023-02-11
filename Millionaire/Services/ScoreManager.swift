import Foundation

final class ScoreManager {
    
    static let shared = ScoreManager()
    
    private let userDefaults = UserDefaults.standard
    private let keyForScore = "scores"
    
    private func saveScore(username: String, userScore: Int) {
        var totalScores = [[String: Int]]()
        let userScore = [username: userScore]
        
        if let scores = userDefaults.value(forKey: keyForScore) {
            guard totalScores == scores as? [[String: Int]] else {
                return
            }
            totalScores.append(userScore)
            userDefaults.set(totalScores, forKey: keyForScore)
        } else {
            totalScores.append(userScore)
            userDefaults.set(totalScores, forKey: keyForScore)
        }
    }
    
    private func loadScore() -> [[String: Int]]? {
        guard let scores = userDefaults.value(forKey: "scores") else { return nil}
        guard let totalScores = scores as? [[String: Int]] else { return nil }
        
        var sortedScores = [[String: Int]]()
        
        sortedScores = totalScores.sorted(by: { $0.values > $1.values })
        
        return totalScores
    }
}
