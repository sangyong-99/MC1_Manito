//
//  Scene1.swift
//  MC1
//
//  Created by 이재혁 on 2023/03/25.
//

import SwiftUI

struct Scene1: View {
    @State var page = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var xpos = 350
    @State var ypos = 150
    
    var body: some View {
        ZStack {
            
            ZStack{
                if self.isTimerRunning {
                    if change {
                        Image("left").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else {
                    Image("right").resizable().frame(width:100, height:150)
                        .position(x: CGFloat(240), y: CGFloat(150))
                }
                
            }.onReceive(timer, perform: {value in
                currentDate = value
                change.toggle()
                xpos -= 10
                if xpos < 250 {
                    isTimerRunning = false
                }
            })
            Spacer()
            
        }.background(Image("paper_background"))
    }
}

struct Scene1_Previews: PreviewProvider {
    static var previews: some View {
        Scene1()
    }
}
