
import Foundation

struct ScoreModel: Codable {
        
    // MARK: - Properties
    var id = UUID().uuidString
    var name: String
    var sum: Int
}
