import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var pageNumber = 1
    @State var startpagebool: Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                if pageNumber == 1 {
                    Start()
                }
                else if pageNumber == 2 {
                    Scene11()
                }
                else if pageNumber == 3 {
                    Scenepersonal1()
                }
            else if pageNumber == 4 {
                    Scenepersonal2()
                }
                else if pageNumber == 5 {
                    Scenepersonal3()
                }
                else if pageNumber == 6 {
                    Scenepersonal4()
                }
                else if pageNumber == 7 {
                    Scenepersonal5()
                }
                else if pageNumber == 8 {
                    sixteam()
                }
                else if pageNumber == 9 {
                    Scene9()
                        
                }
                else if pageNumber == 11 {
                    End()
                        
                }
                
            }
            .navigationTitle("타이틀")
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    if startpagebool{
                        Image("startbutton").resizable()
                            .frame(width: 100, height: 30)
                            .onTapGesture(perform: {
                                pageNumber += 1
                                startpagebool = false
                            })
                    }
                    else{
                        Image("previousbutton").resizable()
                            .frame(width: 100, height: 30)
                            .onTapGesture(perform: {
                                pageNumber -= 1
                            })
                        Image("nextbutton").resizable()
                            .frame(width: 100, height: 30)
                            .onTapGesture(perform: {
                                pageNumber += 1
                            })
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
