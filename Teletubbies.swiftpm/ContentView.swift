import SwiftUI
import AVFoundation
import AVKit


struct ContentView: View {
    @State var pageNumber = 0
    @State var startpagebool: Bool = true
    @State var audioPlayer:AVAudioPlayer!
    let sound1 = Bundle.main.path(forResource: "BGM_Start", ofType: "mp3")
    let sound2 = Bundle.main.path(forResource: "sound2", ofType: "mp3")
    let sound3 = Bundle.main.path(forResource: "Rainbow", ofType: "mp3")
    let monsterappear = Bundle.main.path(forResource: "monsterappear", ofType: "mp3")
    let fight = Bundle.main.path(forResource: "fight", ofType: "mp3")
    var body: some View {
        NavigationView{
            VStack{
                if pageNumber == 0 {
                    Start0()
                }
                else if pageNumber == 1 {
                    Start().onAppear(){
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 2 {
                    Scenepersonal0().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 3 {
                    Scenepersonal2()
                }
                else if pageNumber == 4 {
                    Scenepersonal4()
                }
                else if pageNumber == 5 {
                    Scenepersonal3()
                }
                else if pageNumber == 6 {
                    Scenepersonal5()
                }
                else if pageNumber == 7 {
                    Scenepersonal1()
                }
                else if pageNumber == 8 {
                    PreviousGame()
                }
                
                else if pageNumber == 9{
                    MonsterAppear().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: monsterappear!))
                        audioPlayer?.play()
                                
                    }
                }
                
                else if pageNumber == 10 {
                    Game().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: fight!))
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 11 {
                    End().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound3!))
                        audioPlayer?.play()
                    }
                    
                }
                
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    if startpagebool{
                        Image("startbutton").resizable()
                            .frame(width: 100, height: 30)
                            .onTapGesture(perform: {
                                pageNumber += 1
                                if pageNumber == 2{
                                    startpagebool = false
                                }
                            })
                    }
                    else{
                        Image("previous2").resizable()
                            .frame(width: 100, height: 30)
                            .onTapGesture(perform: {
                                pageNumber -= 1
                            })
                        Image("nextbutton2").resizable()
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
