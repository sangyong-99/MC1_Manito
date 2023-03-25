//
//  Stopmotion.swift
//  MC1_Manito
//
//  Created by 신상용 on 2023/03/24.
//

import Foundation
import SwiftUI
import UIKit


struct Stopmotion: View {
    
    let timer = Timer.publish(every: 0.35, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var bb: Bool = true
    
    var body: some View {
        ZStack{
            if bb {
                Image("1").resizable().scaledToFill()
            }
            else {
                Image("2").resizable().scaledToFill()
            }
            
        }.onReceive(timer, perform: {value in
            currentDate = value
            bb = !bb
        })
            
        
    }
}
