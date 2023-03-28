//
//  Scene10.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct Scene10: View {
    var body: some View {
        ZStack{
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
    }
}

struct Scene10_Previews: PreviewProvider {
    static var previews: some View {
        Scene10()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
