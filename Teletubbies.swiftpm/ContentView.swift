import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var pageNumber = 1
    
    var body: some View {
        NavigationView{
            VStack{
                if pageNumber == 1 {
                    Scene1()
                        .border(.black)
                }
                else if pageNumber == 2 {
                    Scene2()
                        .border(.black)
                }
                else if pageNumber == 3 {
                    Scene3()
                        .border(.black)
                }
                else if pageNumber == 4 {
                    Scene4()
                        .border(.black)
                }
                else if pageNumber == 5 {
                    Scene5()
                        .border(.black)
                }
                else if pageNumber == 6 {
                    Scene6()
                        .border(.black)
                }
                else if pageNumber == 7 {
                    Scene7()
                        .border(.black)
                }
                else if pageNumber == 8 {
                    Scene8()
                        .border(.black)
                }
                else if pageNumber == 9 {
                    Scene9()
                        .border(.black)
                }
                else if pageNumber == 10 {
                    Scene10()
                        .border(.black)
                }
                else if pageNumber == 11 {
                    Scene11()
                        .border(.black)
                }
                /*
                Text("toolBar 예제")
                    .padding()
                    .border(.black)
                 */
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
