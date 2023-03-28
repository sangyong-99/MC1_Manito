//
//  Scene4.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import SwiftUI
import AVFoundation

struct Scenepersonal4: View {
    @State var sceneNumber = 1
    @State var updown = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let timerss = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var up_down: Int = 1
    @State var xpos = 380
    @State var ypos = 300
    @State var rec_xsize = 130
    @State var rec_ysize = 0
    @State var rec_ypos = 100
    @State var countss = 1
    @State var text1 = "미모"
    @State var ufo_xpos = 380
    @State var ufo_ypos = 50
    let syynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack {
            
            ZStack{
                
                
                if sceneNumber == 1 {
                    if change {
                        Image("left").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2 {
                    Image("ufo").resizable()
                        .frame(width: 300, height: 100)
                        .position(x: CGFloat(380), y: CGFloat(50))
                        .zIndex(1)
                    Image("left").resizable().frame(width:100, height:150)
                        .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    Rectangle()
                        .frame(width: CGFloat(rec_xsize), height: CGFloat(rec_ysize))
                        .position(x: CGFloat(380), y: CGFloat(rec_ypos))
                        .foregroundColor(.yellow)
                        .opacity(0.5)
                }
                else if sceneNumber == 3{
                    Image("ufo").resizable()
                        .frame(width: 300, height: 100)
                        .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    
                }
                
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                if countss == 1{
                    countss += 1
                }
                else if countss < 6{
                    if change {
                        ypos -= 20
                    }
                    else {
                        ypos += 20
                    }
                    countss += 1
                }
                else {
                    sceneNumber += 1
                    timer.upstream.connect().cancel()
                }
            })
            .onReceive(timerss, perform: {value in
                currentDate = value
                if countss == 6{
                    if up_down == 1 {
                        rec_ysize += 20
                        rec_ypos += 10
                        if rec_ysize == 280{
                            up_down += 1
                        }
                    }
                    else if up_down == 2{
                        rec_ysize -= 20
                        rec_ypos -= 10
                        ypos -= 20
                        if rec_ysize == 0 {
                            sceneNumber += 1
                            up_down += 1
                        }
                    }
                    else if up_down == 3{
                        ufo_ypos -= 10
                    }
                    
                }
                
                
                
                
                
            })
            Spacer()
            
        }
        .background(Image("background_school"))
    }
}

struct Scenepersonal4_Previews: PreviewProvider {
    static var previews: some View {
        Scenepersonal4()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

