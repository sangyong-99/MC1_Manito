//
//  Scene5.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct Scene5: View {
    
    var body: some View {
        ZStack{
            Capsule()
                .frame(width: 200, height: 300)
                .foregroundColor(.yellow)
                .opacity(0.5)
                .animation(.linear(duration: 2), value: 1.0)
            
            Image("right_reverse").resizable().frame(width:200, height: 200)
                .position(x: CGFloat(400), y: CGFloat(200))
        }
    }
}

struct Scene5_Previews: PreviewProvider {
    static var previews: some View {
        Scene5()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
