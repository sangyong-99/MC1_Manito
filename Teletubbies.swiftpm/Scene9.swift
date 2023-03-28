//
//  Scene9.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct Scene9: View {
    @State var sceneNumber = 2
    @State var timerCount = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    
    
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
                        
                        Image("monster").resizable().frame(width:400, height:300)
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
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2{ // 몬스터가 텔레토비를 공격
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
                        
                        Image("monster").resizable().frame(width:400, height:300)
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
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 3 { // 텔레토비가 몬스터한테 물감 공격
                    ZStack{
                        
                    }
                }
                else if sceneNumber == 4{ // 몬스터가 컬러로 바뀜
                    
                }
                else if sceneNumber == 5 { // 몬스터 죽음
                    
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                
                if sceneNumber == 1 {
                    
                }
                if timerCount >= 12 {
                    //sceneNumber = 2
                    //timer.upstream.connect().cancel()
                }
                //timer.upstream.connect().cancel() 타이머 취소
            }).onReceive(milli_timer, perform: { value in
                
            })
            Spacer()
            
        }
        .background(Image("background_school"))
    }
}

struct Scene9_Previews: PreviewProvider {
    static var previews: some View {
        Scene9()
            .previewInterfaceOrientation(.landscapeRight
            )
    }
}
