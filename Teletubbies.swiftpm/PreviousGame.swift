//
//  sixteam.swift
//  Teletubbies
//
//  Created by 신상용 on 2023/03/28.
//

import SwiftUI
import AVFoundation

struct PreviousGame: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var sceneNumber = 1
    @State var stop = 1
    @State var ufo_xpos = 380
    @State var ufo_ypos = -40
    @State var six_xsize = 0
    @State var six_ysize = 0
    @State var six_xpos = 380
    @State var six_ypos = 0
    @State var countss = 0
    var body: some View {
        ZStack{
            ZStack{
                if sceneNumber == 1{
                    Image("ufo").resizable()
                        .frame(width: 300, height: 100)
                        .position(x: CGFloat(380), y: CGFloat(ufo_ypos))
                }
                else if sceneNumber == 2{
                    Image("ufo").resizable().zIndex(1)
                        .frame(width: 300, height: 100)
                        .position(x: CGFloat(380), y: CGFloat(50))
                    
                    Image("paper").resizable()
                        .frame(width: CGFloat(six_xsize), height: CGFloat(six_ysize))
                        .position(x: CGFloat(six_xpos), y: CGFloat(six_ypos))
                    
                }
            }.onReceive(timer, perform: { value in
                if stop == 1{
                    ufo_ypos += 10
                    if ufo_ypos == 50{
                        stop += 1
                    }
                }
                else if stop == 2{
                    sceneNumber += 1
                    stop += 1
                }
                else if stop == 3{
                    six_xsize += 30
                    six_ysize += 15
                    six_ypos += 30
                    countss += 1
                    if countss == 10{
                        stop += 1
                    }
                }
            })
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct PreviousGame_Previews: PreviewProvider {
    static var previews: some View {
        PreviousGame().previewInterfaceOrientation(.landscapeRight)
    }
}
