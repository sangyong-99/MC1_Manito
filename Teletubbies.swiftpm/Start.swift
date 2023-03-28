//
//  Start.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI


struct Start: View {
    @State private var isNextViewPresented = false

    var body: some View {
        VStack {
                    Image("startbutton")
                        .onTapGesture {
                            self.isNextViewPresented = true
                            
                        }
                        
                }
            }
    
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
