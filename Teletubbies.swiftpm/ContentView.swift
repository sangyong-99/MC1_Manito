import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var pageNumber = 1
    
    var body: some View {
        NavigationView{
            VStack{
                Scenepersonal()
            }
            .navigationTitle("타이틀")
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous"){
                        pageNumber -= 1
                        if pageNumber <= 0 {
                            pageNumber = 1
                        }
                        
                    }
                    Button("Next"){
                        pageNumber += 1
                        if pageNumber >= 12 {
                            pageNumber = 11
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
