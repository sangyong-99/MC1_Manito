//
//  Scene9.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import AVFoundation
import SwiftUI
import AVKit

struct Game: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "용사들이 투닥거리는 사이, 무시무시한 괴물이 용사들의 색을 빼앗으려고 해요!")
    let siri_naration2 = AVSpeechUtterance(string: "몬스터는 릴리와 수, 그리고 로키의 색을 빼앗았어요! -- 재미와 낭만을 뺴앗긴 용사들은 사과 폭탄을 꺼내 공격해요.")
    let siri_naration3 = AVSpeechUtterance(string: "재미와 낭만을 뺴앗긴 용사들은 사과 폭탄을 꺼내 공격해요.")
    let siri_naration4 = AVSpeechUtterance(string: "주춤하던 몬스터. 그러나 나머지 모두의 색까지 빼앗아버려요!")
    let siri_naration5 = AVSpeechUtterance(string: "용사들은 힘을 합칠 때라는 걸 깨달아요. 우리의 색을 다 같이 한번 모아보자!")
    let siri_naration6 = AVSpeechUtterance(string: "모두의 힘을 합쳐 쏜 무지개 빔을 맞은 몬스터는 결국 쓰러지고 말았어요. ")
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let attack = Bundle.main.path(forResource: "Attack", ofType: "mp3")
    let rainbowattack = Bundle.main.path(forResource: "rainbowattack", ofType: "mp3")
    let telehit = Bundle.main.path(forResource: "telehit", ofType: "mp3")
    let monsterhit = Bundle.main.path(forResource: "monsterhit", ofType: "mp3")
    let monsterdie = Bundle.main.path(forResource: "monsterdie", ofType: "mp3")
    @State var startLine = true
    @State var audioPlayer:AVAudioPlayer!
    @State var sceneNumber = 1
    @State var timerCount = 0
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    @State var color_attack_xpos = 200
    @State var color_attack_ypos = 230
    @State var sceneChangeCount = 0
    @State var monsterOpacity = 1.0
    @State var monsterDeathDuration = 2.5
    @State var prefixSum = 1
    @State var attackSceneDuration = 0
    @State var audio_scene_count = 1
    @State var audio_scene_bool: Bool = false
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 텔레토비랑 몬스터 대기
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2 { // 텔레토비 <- 몬스터 공격 전달
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 3 { // 텔레토비 <- 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(270))
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                else if sceneNumber == 4{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 5 { // 텔레토비 -> 몬스터 공격 전달
                    Image("appleweapon").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 6{ // 텔레토비 -> 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 7{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 8{ // 텔레토비 <- 몬스터 공격 전달
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 9{ // 텔레토비 <- 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(270))
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                if sceneNumber == 10{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 11{ // 텔레토비 -> 몬스터 최후의 공격 전달
                    Image("rainbow_apple").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 12{ // 텔레토비 -> 몬스터 최후의 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 13{ // 최후의 공격 받은 몬스터 죽음
                    Image("threepeople1_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2_black").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(270))
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                        .opacity(monsterOpacity)
                        .animation(.easeIn(duration:monsterDeathDuration), value: monsterOpacity)
                }
                else { // 빈 화면
                    
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                timerCount += 1
                // 첫 대사를 위한 블럭
                if startLine == true {
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.5
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    startLine = false
                }
                if sceneNumber == 1 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 10 {
                        sceneNumber = 2
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 4 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 11 {
                        sceneNumber = 5
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 7 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 8
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 10 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 9 {
                        sceneNumber = 11
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 13 {
                    monsterOpacity = 0
                    sceneChangeCount += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 9{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 10{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: monsterdie!))
                        audioPlayer?.setVolume(0.3, fadeDuration: 1)
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if sceneChangeCount > 5 {
                        sceneNumber = 13
                    }
                }
                else{
                    
                }
            }).onReceive(milli_timer, perform: { value in
                if sceneNumber == 2 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    //소리나는 코드
                    if !audio_scene_bool && audio_scene_count == 1{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 2{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: attack!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if attack_xpos < 200 {
                        sceneNumber = 3
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 5 {
                    prefixSum += 1
                    color_attack_xpos += prefixSum
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 3{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 4{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: attack!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if color_attack_xpos > 500 {
                        sceneNumber = 6
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 8 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 5{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 6{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: attack!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    if attack_xpos < 200 {
                        sceneNumber = 9
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 11 {
                    prefixSum += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 7{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 8{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: rainbowattack!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    color_attack_xpos += prefixSum
                    if color_attack_xpos > 500 {
                        sceneNumber = 12
                        prefixSum = 0
                    }
                }
                
                if sceneNumber == 3 {
                    attackSceneDuration += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 2{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 3{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: telehit!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        // 시리 나레이션
                        siri_naration2.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration2.rate = 0.5
                        siri_naration2.pitchMultiplier = 1
                        siri_naration2.volume = 50.0
                        speech.speak(siri_naration2)
                        sceneNumber = 4
                    }
                }
                else if sceneNumber == 6 {
                    attackSceneDuration += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 4{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 5{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: monsterhit!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        // 시리 나레이션
                        siri_naration4.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration4.rate = 0.5
                        siri_naration4.pitchMultiplier = 1
                        siri_naration4.volume = 50.0
                        speech.speak(siri_naration4)
                        sceneNumber = 7
                    }
                }
                else if sceneNumber == 9 {
                    attackSceneDuration += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 6{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 7{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: telehit!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        
                        siri_naration5.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration5.rate = 0.5
                        siri_naration5.pitchMultiplier = 1
                        siri_naration5.volume = 50.0
                        speech.speak(siri_naration5)
                        sceneNumber = 10
                    }
                }
                else if sceneNumber == 12 {
                    attackSceneDuration += 1
                    //소리 나는 코드
                    if !audio_scene_bool && audio_scene_count == 8{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 9{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: monsterhit!))
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                    
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        siri_naration6.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration6.rate = 0.5
                        siri_naration6.pitchMultiplier = 1
                        siri_naration6.volume = 50.0
                        speech.speak(siri_naration6)
                        sceneNumber = 13
                    }
                }
            })
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
