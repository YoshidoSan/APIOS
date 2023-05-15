

import SwiftUI

struct ContentView: View {
    @State var flag = true
    @State private var Scale: CGFloat = 1.0
    @State private var position: CGSize = .zero
    @State private var position2: CGSize = .zero
    var destination = CGPoint(x: 500, y: 500)
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: 120, height: 120)
                .offset(x: 0, y: 60)
        }
        VStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 120, height: 120)
            
                .scaleEffect(Scale)
                .offset(x: position.width, y: position.height)
                .onAppear(){
                    self.position = CGSize(width: 0, height: -800)//zaczynamy od góry ekranu
                    withAnimation(.linear(duration: 2).repeatForever()) {
                        self.position = CGSize(width: 0, height: -60)//połowa wysokości koła
                        self.Scale = 0.0//dąży do skali 0
                    }
                }
                   
        }
        VStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 120, height: 120)
            
                .scaleEffect(Scale)
                .offset(x: position2.width, y: position2.height)
                .onAppear(){
                    self.position2 = CGSize(width: 400, height: -300)
                    withAnimation(.linear(duration: 2).repeatForever()) {
                        self.position2 = CGSize(width: 0, height: -200)
                        self.Scale = 0.0
                    }
                }
                   
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
