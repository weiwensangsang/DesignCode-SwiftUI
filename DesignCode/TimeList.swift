//
//

import SwiftUI

struct TimeList: View {
    
    @EnvironmentObject var coreData : CoreData
    @State var showContent = false
    
    var body: some View {
        VStack() {
            
            Button(action: {
                }) {
                    GeometryReader { geometry in
                        TimeView(title : self.coreData.hour)
                        
                    }
                    .frame(width: 360, height: 360)
            }
            
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.coreData.isOn.toggle()
                }
                
                
            }) {
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
    
    @EnvironmentObject var coreData : CoreData
    var title = 0
    var image = "Illustration1"
    var shadowColor = Color("backgroundShadow3")
    var flag = true
    
    
    var body: some View {
        return VStack() {
            AnimatableColorText(from: UIColor.systemGray, to: UIColor.systemGray6, pct: self.coreData.isOn ? 1 : 0) {
                Text(self.title <= 9 ? "0\(self.title)" : "\(self.title)")
                    .font(Font.custom("Canterbury", size: 250))
                    .fontWeight(.heavy)
                
            }.multilineTextAlignment(.center).padding()
            
        }
        .background(Color.gray)
        .cornerRadius(30)
        .frame(width: 360, height: 360)
        .shadow(color: Color.gray, radius: 10)
    }
}



