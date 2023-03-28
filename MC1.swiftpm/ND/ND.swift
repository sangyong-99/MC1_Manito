//
//  ND.swift
//  MC1
//
//  Created by 이재혁 on 2023/03/25.
//

import SwiftUI
import UIKit

struct ND: View {
    @State var n_sceneNumber = 1

    var body: some View {
        
        
        // 자동 화면 전환 코드
//        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true){timer in
//            n_sceneNumber += 1
//            print(n_sceneNumber)
//            if n_sceneNumber == 2 {
//                timer.invalidate()
//            }
//        }
        VStack {
            if n_sceneNumber == 1 {
                ND1()
            }
            else if n_sceneNumber == 2{
                ND2()
            }
            else if n_sceneNumber == 3{
                ND3()
            }
        }
        
    }
}



struct ND_Previews: PreviewProvider {
    static var previews: some View {
        ND()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
