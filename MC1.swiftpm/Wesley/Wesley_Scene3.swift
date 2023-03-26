//
//  SwiftUIView 2.swift
//  
//
//  Created by 이재혁 on 2023/03/26.
//

import SwiftUI

struct Wesley_Scene3: View {
    
    @State var animate: Bool = false
    let timing: Double = 1.0
    
    var body: some View {
        VStack {
            Button("애니메이션") {
                animate.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 200, height: 100)
                .overlay(
                    Text("animation : linear")
                        .foregroundColor(Color.white)
                )
                .animation(Animation.linear(duration: timing))
        }
    }
}

struct Wesley_Scene3_Previews: PreviewProvider {
    static var previews: some View {
        Wesley_Scene3()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
