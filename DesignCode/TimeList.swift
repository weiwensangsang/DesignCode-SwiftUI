//
//

import SwiftUI

struct TimeList: View {
    
    @EnvironmentObject var coreData : CoreData
    @State var showContent = false
    
    var body: some View {
        VStack() {
             
            Button(action: { self.coreData.play()}) {
                GeometryReader { geometry in
                    TimeView(title : self.coreData.hour)
                    
                }
                .frame(width: 360, height: 360)
            }
            
            Button(action: { self.coreData.colorChange()}) {
                GeometryReader { geometry in
                    TimeView(title : self.coreData.minute)
                }
                .frame(width: 360, height: 360)
            }
        }
    }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        TimeList()
            .environmentObject(CoreData())
    }
}
#endif

struct TimeView: View {

    var title = 0
    var image = "Illustration1"
    var shadowColor = Color("backgroundShadow3")
    
    
    var body: some View {
        return VStack() {
            Text(title <= 9 ? "0\(title)" : "\(title)")
                .font(Font.custom("Canterbury", size: 250))
                .fontWeight(.heavy)
                
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()
                .transition(.slide)
                .animation(.linear(duration: 1))
        }
        .background(Color.gray)
        .cornerRadius(30)
        .frame(width: 360, height: 360)
        .shadow(color: Color.gray, radius: 10)
    }
}



