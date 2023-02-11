import Foundation
import AVFoundation

/// This class is responsible for playing sounds in the game
final class SoundManager {
    
    static let shared = SoundManager()
    
    // MARK: - Private
    
    enum SoundStatus {
        case playing
        case stopped
        case off
    }
    
    enum Sounds: String {
        case startApp = "sount-start-module"
        case startGame = "sound-question-module-start-game"
        case timerGame = "sound-question-module-waiting"
        case rightAnswer = "sound-question-module-right-answer"
        case failAnswer = "sound-question-module-fail-answer"
    }
    
    private var player: AVAudioPlayer?
    private var playStatus: SoundStatus = .stopped
    
    func playSound(sound: Sounds) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
            
            playStatus = .playing
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        guard let guardPlayer = player else { return }
        guardPlayer.stop()
        player = nil
    }
}
