//
//  Scene2.swift
//  MC1
//
//  Created by 이재혁 on 2023/03/25.
//

import SwiftUI

struct Scene2: View {
    var body: some View {
        ZStack {
            Text("Loki Scene2")
        }.background(Image("paper_background"))
    }
}

struct Scene2_Previews: PreviewProvider {
    static var previews: some View {
        Scene2()
    }
}
