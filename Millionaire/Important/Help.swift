// MARK: - How to add sounds

// MARK: - All the sounds you can find in Sounds' directory

// MARK: - Use Dispatch/Timer etc to do delay before any actions

// MARK: - Optional: Add button for on/off sounds to a module that playing sound

/*

 import AVFoundation

// OPTIONAL: Add this enum to follow status and control it

enum SoundStatus {
    
    case stopped, playing
}

var player: AVAudioPlayer?

func playSound(soundName: String) {
    guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        guard let player = player else { return }

        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}

func stopSound() {
    guard let guardPlayer = player else { return }
    guardPlayer.stop()
    player = nil
}

*/
