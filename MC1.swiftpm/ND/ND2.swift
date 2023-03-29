//
//  ND2.swift
//  
//
//  Created by 신상용 on 2023/03/25.
//

import SwiftUI

struct ND2: View {
    let timer = Timer.publish(every: 0.35, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var bb: Bool = true
    
    var body: some View {
        
        VStack{
            if bb {
                Image("left").resizable().scaledToFill()
            }
            else {
                Image("right").resizable().scaledToFill()
            }
            
        }.onReceive(timer, perform: {value in
            currentDate = value
            bb = !bb
        })
        
    
        
    }
}

struct ND2_Previews: PreviewProvider {
    static var previews: some View {
        ND2()
    }
}
