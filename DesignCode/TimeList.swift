//
//

import SwiftUI

struct TimeList: View {
    
    @EnvironmentObject var coreData : CoreData
    @State var showContent = false
    
    var body: some View {
        VStack() {
            
            Button(action: { }) {
                GeometryReader { geometry in
                    TimeView(title: self.coreData.hour <= 9 ? "0\(self.coreData.hour)" : "\(self.coreData.hour)")
                }
                .frame(width: 360, height: 360)
            }
            
            Button(action: { }) {
                GeometryReader { geometry in
                    TimeView(title: self.coreData.minute <= 9 ? "0\(self.coreData.minute)" : "\(self.coreData.minute)")
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
    var totalClicked = 0
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack() {
            Text(title)
                .font(Font.custom("Canterbury", size: 250))
                .fontWeight(.heavy)
                
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()
            
            
            //Spacer()
            
        }
        .background(Color.gray)
        .cornerRadius(30)
        .frame(width: 360, height: 360)
        .shadow(color: Color.gray, radius: 10)
    }
}



