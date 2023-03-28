//
//  Scene11.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct Scene11: View {
    @State var sceneNumber = 1
    @State var timerCount = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    
    @State var xpos = 400
    @State var ypos = 240
    
    @State var ufo_xpos = 640
    @State var ufo_ypos = 280
    var ufo_ypos_list: [Int] = [8, 8, 8, 7, 7, 6, 6, 5, 5, 4, 3, 2, 1, 0, 0, 0 ,-3, -4, -5, -8]
    @State var ufo_ypos_list_index = 0
    
    var body: some View {
        ZStack {
            
            ZStack{
                if sceneNumber == 1 { // 점프하면서 대사?
                    if change {
                        Image("Lily1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        Image("ufo").resizable().frame(width:600, height: 500)
                            .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    }
                    else {
                        Image("Lily2").resizable().frame(width:150, height:155)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        Image("ufo").resizable().frame(width:600, height: 500)
                            .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    }
                }
                else if sceneNumber == 2{ // UFO로 쏙 들어가는 릴리
                    ZStack{
                        Image("Lily1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        Image("ufo").resizable().frame(width:600, height: 500)
                            .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    }
                }
                else if sceneNumber == 3 { // 릴리가 탄 UFO 포물선(ND가 구현할예정)모양으로 화면에서 빠져나간다.
                    ZStack{
                        Image("Lily1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        Image("ufo").resizable().frame(width:600, height: 500)
                            .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    }
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                
                if sceneNumber == 1 && timerCount%2 == 1 {
                    ypos -= 10
                }
                else if sceneNumber == 1 && timerCount%2 == 0{
                    ypos += 10
                }
                
                if timerCount >= 12 {
                    sceneNumber = 2
                    timer.upstream.connect().cancel()
                }
                //timer.upstream.connect().cancel() 타이머 취소
                
            }).onReceive(milli_timer, perform: { value in
                if sceneNumber == 2 {
                    if sceneNumber == 2 && xpos < 600 {
                        xpos += 10
                        ypos -= ufo_ypos_list[ufo_ypos_list_index]
                        ufo_ypos_list_index += 1
                    }
                    else {
                        sceneNumber = 3
                    }
                }
                else if sceneNumber == 3 {
                    if xpos > 0 {
                        xpos -= 10
                        ypos -= 5
                        
                        ufo_xpos -= 10
                        ufo_ypos -= 5
                        //UFO 포물선 날아가는거 나중에 작업
                    }
                }
            })
            
            Spacer()
            
        }.background(Image("background"))
    }
}

struct Scene11_Previews: PreviewProvider {
    static var previews: some View {
        Scene11()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
