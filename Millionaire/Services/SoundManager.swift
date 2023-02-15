import Foundation
import AVFoundation

/// This class is responsible for playing sounds in the game
final class SoundManager {
    
    static let shared = SoundManager()
    
    // MARK: - Private
    
    enum SoundStatus {
        case playing
        case stopped
    }
    
    enum Sounds: String {
        case startApp = "sount-start-module"
        case startGame = "sound-question-module-start-game"
        case timerGame = "sound-question-module-waiting"
        case asnwerDidSelected = "sound-answer-did-tap"
        case rightAnswer = "sound-question-module-right-answer"
        case failAnswer = "sound-question-module-fail-answer"
    }
    
    enum HelpSounds: String {
        case possibleErrorSound = "help-button-sound"
        case fiftyHelpSound = "fitfty-fifty-sound"
    }
    
    private var player: AVAudioPlayer?
    private var helpPlayer: AVAudioPlayer?
    private var playStatus: SoundStatus = .stopped
    
    func playHelpSound(helpSound: HelpSounds) {
        guard let player = player else { return }
        player.pause()
        
        guard let url = Bundle.main.url(
            forResource: helpSound.rawValue, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            helpPlayer = try AVAudioPlayer(
                contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let helpPlayer = helpPlayer else { return }
            helpPlayer.play()
            
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                helpPlayer.stop()
                player.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSound(sound: Sounds) {
        
        if playStatus == .playing {
            stopSound()
        }
        
        guard let url = Bundle.main.url(
            forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(
                contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            
            playStatus = .playing
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func stopSound() {
        guard let guardPlayer = player else { return }
        guardPlayer.stop()
    }
}
