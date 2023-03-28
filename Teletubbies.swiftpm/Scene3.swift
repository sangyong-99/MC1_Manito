//
//  Scene3.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct Scene3: View {
    @State var text = "나는야 대학생 로키."
    
    let syynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        Text("Scene3")
        VStack(spacing: 50){
            Button(action: {
                let utterance = AVSpeechUtterance(string: self.text)
                utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                utterance.rate = 0.4
            
                syynthesizer.speak(utterance)
            }){
                Text("Start TTS")
            }
        }
    }
}

struct Scene3_Previews: PreviewProvider {
    static var previews: some View {
        Scene3()
    }
}
