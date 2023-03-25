//
//  Loki.swift
//  MC1
//
//  Created by 이재혁 on 2023/03/25.
//

import SwiftUI

struct Loki: View {
    @State var sceneNumber = 1
    
    var body: some View {
        var btn = Button("Next"){
            sceneNumber += 1
        }.buttonStyle(.borderedProminent)
        
        ZStack {
            HStack{
                if sceneNumber == 1 {
                    Scene1()
                }
                else if sceneNumber == 2 {
                    Scene2()
                }
                else if sceneNumber == 3 {
                    Scene3()
                }
                else if sceneNumber == 4 {
                    Scene4()
                }
                else{
                    Text("Loki_Scene_END")
                }
                
                VStack{
                    if sceneNumber < 5 {
                        btn
                    }
                }
            }
        }.background(Image("paper_background"))
    }
}

struct Loki_Previews: PreviewProvider {
    static var previews: some View {
        Loki()
    }
}
