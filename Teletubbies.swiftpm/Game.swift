//
//  Scene9.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct Game: View {
    @State var sceneNumber = 1
    @State var timerCount = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    @State var color_attack_xpos = 200
    @State var color_attack_ypos = 250
    
    @State var sceneChangeCount = 0
    
    @State var monsterOpacity = 1.0
    @State var monsterDeathDuration = 2.5
    
    @State var prefixSum = 1
    @State var attackSceneDuration = 0
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 텔레토비와 몬스터 그냥 움직이기만 하고 대기
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2 { // 몬스터가 텔레토비를 공격
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 3 { // 텔레토비가 몬스터한테 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(200))
                    
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                else if sceneNumber == 4{ // 가만히 대기
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 5 { // 텔레토비가 몬스터 공격
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 6{ // 몬스터 텔레토비한테 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(200))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 7{ // 가만히 있음
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 8{ // 몬스터가 텔레토비 공격 2회차
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 9{ // 몬스터가 텔레토비 공격 2회차 맞음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(200))
                    
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                if sceneNumber == 10{ // 가만히 있음
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 11{ // 텔레토비가 몬스터 공격 2회차
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 12{ // 텔레토비가 몬스터 공격 2회차 맞음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(200))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 13{ // 몬스터 죽음
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(200))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                        .opacity(monsterOpacity)
                        .animation(.easeIn(duration:monsterDeathDuration), value: monsterOpacity)
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                
                if sceneNumber == 1 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 2
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 4 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
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
                    if sceneChangeCount > 5 {
                        sceneNumber = 11
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 13 {
                    monsterOpacity = 0
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 14
                    }
                }
                else{
                    
                }
                //timer.upstream.connect().cancel() 타이머 취소
            }).onReceive(milli_timer, perform: { value in
                if sceneNumber == 2 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    if attack_xpos < 200 {
                        sceneNumber = 3
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 5 {
                    prefixSum += 1
                    color_attack_xpos += prefixSum
                    if color_attack_xpos > 500 {
                        sceneNumber = 6
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 8 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    if attack_xpos < 200 {
                        sceneNumber = 9
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 11 {
                    prefixSum += 1
                    color_attack_xpos += prefixSum
                    if color_attack_xpos > 500 {
                        sceneNumber = 12
                        prefixSum = 0
                    }
                }
                
                if sceneNumber == 3 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 4
                    }
                }
                else if sceneNumber == 6 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 7
                    }
                }
                else if sceneNumber == 9 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 10
                    }
                }
                else if sceneNumber == 12 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 13
                    }
                }
            })
            Spacer()
            
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
