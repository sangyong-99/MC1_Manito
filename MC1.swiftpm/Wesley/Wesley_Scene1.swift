//
//  SwiftUIView.swift
//  
//
//  Created by 이재혁 on 2023/03/26.
//

import SwiftUI

struct Wesley_Scene1: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var index = 0
    
    var widths: [CGFloat] = [480, 470, 900]
    var heights: [CGFloat] = [520, 510, 330]
    var radiuses: [CGFloat] = [210, 0, 0]
    var backgrounds: [Image] = [Image("oz1"), Image("oz2"), Image("oz3")]
    
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            ZStack{
                backgrounds[index]
                    .frame(width: widths[index], height: heights[index])
                    .foregroundColor(.white)
                    .cornerRadius(radiuses[index])
                    .animation(.linear(duration: 1.0))
                    
            }
        }.onReceive(timer, perform: {value in
            index += 1
            if index == 3 {
                index = 0
            }
        })
    }
}

struct Wesley_Scene1_Previews: PreviewProvider {
    static var previews: some View {
        Wesley_Scene1()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
