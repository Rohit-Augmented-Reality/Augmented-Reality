//
//  Helpers.swift
//  Majin
//
//  Created by Rohit Nair on 6/11/18.
//  Copyright © 2018 Rohit Nair. All rights reserved.
//

import Foundation
import AVFoundation

let synth = AVSpeechSynthesizer()
var audioPlayer = AVAudioPlayer()

func SpeakText(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    synth.speak(utterance)
}

func PlayAudioFile(fileName: String, fileExtension: String) {
    do {
        let filePath = URL.init(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: fileExtension)!)
        audioPlayer = try AVAudioPlayer(contentsOf: filePath)
        audioPlayer.play()
    }
    catch {
        SpeakText(text: TextConstants.ErrorMsg + " in audio player")
    }
}
