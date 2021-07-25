//
//  AudioController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 25/07/21.
//

import Foundation
import AVFoundation

class AudioController {
    static var audioPlayer: AVAudioPlayer?
    
    public static func playAudio(name: String) {
        let url: URL = Bundle.main.url(forResource: name, withExtension: "wav")!
        audioPlayer = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)

        audioPlayer?.volume = 0.05
        audioPlayer?.play()
    }
    
    public static func stopAudio() {
        audioPlayer?.stop()
    }
}
