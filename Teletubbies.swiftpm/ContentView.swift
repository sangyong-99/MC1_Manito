import SwiftUI
import AVFoundation
import AVKit


struct ContentView: View {
    let start00 = Bundle.main.path(forResource: "start00", ofType: "mp3")
    let sound1 = Bundle.main.path(forResource: "BGM_Start", ofType: "mp3")
    let sound2 = Bundle.main.path(forResource: "sound2", ofType: "mp3")
    let sound3 = Bundle.main.path(forResource: "Rainbow", ofType: "mp3")
    let monsterappear = Bundle.main.path(forResource: "monsterappear", ofType: "mp3")
    let fight = Bundle.main.path(forResource: "fight", ofType: "mp3")
    let Lingo_Voice = Bundle.main.path(forResource: "Lingo_Voice", ofType: "m4a")
    @State var pageNumber = 0
    @State var startpagebool: Bool = true
    @State var audioPlayer:AVAudioPlayer!

    var body: some View {
        NavigationView{
            VStack{
                if pageNumber == 0 {
                    Start1().onAppear(){
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: start00!))
                        audioPlayer?.setVolume(0.3, fadeDuration: 1)
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 1 {
                    Start2().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
                        audioPlayer?.setVolume(0.25, fadeDuration: 1)
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 2 {
                    ScenepersonalLily().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
                        audioPlayer?.setVolume(0.25, fadeDuration: 1)
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 3 {
                    ScenepersonalSu()
                }
                else if pageNumber == 4 {
                    ScenepersonalLoki()
                }
                else if pageNumber == 5 {
                    ScenepersonalNd()
                }
                else if pageNumber == 6 {
                    ScenepersonalWesley()
                }
                else if pageNumber == 7 {
                    ScenepersonalGenie()
                }
                else if pageNumber == 8 {
                    PreviousGame()
                }
                else if pageNumber == 9{
                    MonsterAppear().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: monsterappear!))
                        audioPlayer?.setVolume(0.35, fadeDuration: 1)
                        audioPlayer?.play()
                        
                    }
                }
                else if pageNumber == 10{
                    ThreeThree()
                }
                else if pageNumber == 11 {
                    Game().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: fight!))
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 12 {
                    End().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound3!))
                        audioPlayer?.play()
                    }
                }
                else if pageNumber == 13 {
                    End2().onAppear(){
                        audioPlayer?.stop()
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Lingo_Voice!))
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
