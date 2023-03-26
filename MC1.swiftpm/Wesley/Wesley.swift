//
//  Wesley.swift
//  MC1
//
//  Created by 이재혁 on 2023/03/25.
//

import SwiftUI

struct Wesley: View {
    @State var sceneNumber = 1
    var body: some View {
        let btn = Button("Next"){
            sceneNumber += 1
        }.buttonStyle(.borderedProminent)
        
        ZStack {
            HStack{
                if sceneNumber == 1 {
                    Wesley_Scene1()
                }
                else if sceneNumber == 2 {
                    Wesley_Scene2()
                }
                else if sceneNumber == 3 {
                    Wesley_Scene3()
                }
                else{
                    Text("Wesley_Scene_END")
                }
                
                VStack{
                    if sceneNumber < 4 {
                        btn
                    }
                }
            }
        }.background(Image("paper_background"))
    }
}

struct Wesley_Previews: PreviewProvider {
    static var previews: some View {
        Wesley()
    }
}
