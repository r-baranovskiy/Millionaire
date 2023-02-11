
import Foundation

final class ScoreManager {
    
    static let shared = ScoreManager()
    
    private let dataSourceURL: URL
    private var allSaves: [ScoreModel] {
        get {
            do {
                let decoder = PropertyListDecoder()
                let data = try Data(contentsOf: dataSourceURL)
                let decodedNotes = try! decoder.decode([ScoreModel].self, from: data)
                
                return decodedNotes
            } catch {
                return []
            }
        }
        set {
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(newValue)
                
                try data.write(to: dataSourceURL)
            } catch {
                
            }
        }
    }
    
    // MARK: - Life Cycle
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let notesPath = documentsPath.appendingPathComponent("name").appendingPathExtension("plist")
        
        dataSourceURL = notesPath
    }
    
    // MARK: - Functions
    func getAllSaves() -> [ScoreModel] {
        return allSaves
    }
    
    func create(score: ScoreModel) {
        allSaves.insert(score, at: 0)
    }
    
    func setComplete(score: ScoreModel, index: Int) {
        allSaves[index] = score
    }
    
    func delete(score: ScoreModel) {
        if let index = allSaves.firstIndex(where: { $0.id == score.id }) {
            allSaves.remove(at: index)
        }
    }
}
//final class ScoreManager {
//
//    static let shared = ScoreManager()
//
//    private let userDefaults = UserDefaults.standard
//    private let keyForScore = "scores"
//
//    private func saveScore(username: String, userScore: Int) {
//        var totalScores = [[String: Int]]()
//        let userScore = [username: userScore]
//
//        if let scores = userDefaults.value(forKey: keyForScore) {
//            guard totalScores == scores as? [[String: Int]] else {
//                return
//            }
//            totalScores.append(userScore)
//            userDefaults.set(totalScores, forKey: keyForScore)
//        } else {
//            totalScores.append(userScore)
//            userDefaults.set(totalScores, forKey: keyForScore)
//        }
//    }
//
//    private func loadScore() -> [[String: Int]]? {
//        guard let scores = userDefaults.value(forKey: "scores") as? [[String: Int]] else { return nil}
//
//        //var sortedScores = [[String: Int]]()
//
//        return scores
//    }
//}
