//
//  SwiftUIView 3.swift
//  
//
//  Created by 이재혁 on 2023/03/26.
//

import SwiftUI

struct Wesley_Scene2: View {
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            ZStack{
                Rectangle()
                    .frame(width: 480, height: 520)
                    .foregroundColor(.white)
                    
            }
        }
    }
}

struct Wesley_Scene2_Previews: PreviewProvider {
    static var previews: some View {
        Wesley_Scene2()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
