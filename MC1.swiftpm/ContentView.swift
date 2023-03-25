import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            NavigationView(content: {
                HStack{
                    NavigationLink(destination: Loki()) { Text("Loki START") }
                    NavigationLink(destination: Wesley()) { Text("Wesley START") }
                    NavigationLink(destination: Lily()) { Text("Lily START") }
                    NavigationLink(destination: ND()) { Text("N.D START") }
                    NavigationLink(destination: Genie()) { Text("Genie START") }
                    NavigationLink(destination: Su()) { Text("Su START") }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
