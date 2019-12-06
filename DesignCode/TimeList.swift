//
//

import SwiftUI

struct TimeList: View {
    @EnvironmentObject var model: Model
    
    
    @EnvironmentObject var coreData : CoreData
    @State var showContent = false
    
    var body: some View {
        
        Group {
            if !model.landscape {
                VStack() {
                    Text(self.coreData.currentDate)
                        .font(Font.custom("Canterbury", size: 30))
                        .foregroundColor(Color.purple)
                        .fontWeight(.bold)
                        .frame(width: 360, height:40, alignment: .bottomTrailing)
                    
                    Text("周" + self.coreData.weekday)
                        .font(Font.custom("Canterbury", size: 28))
                        .foregroundColor(Color.purple)
                        .fontWeight(.heavy)
                        .frame(width: 360, height:40, alignment: .bottomTrailing)
                    
                    GeometryReader { geometry in
                        TimeView(time : self.coreData.hour, type: "hour")
                    }
                    .frame(width: 360, height: 360)
                    
                    
                    
                    GeometryReader { geometry in
                        TimeView(time : self.coreData.minute, type: "minute")
                    }
                    .frame(width: 360, height: 360)
                    
                }
                
                
            } else {
                VStack() {
                    HStack() {
                        Text("周" + self.coreData.weekday)
                            .font(Font.custom("Canterbury", size: 28))
                            .foregroundColor(Color.purple)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        Text(self.coreData.currentDate)
                            .font(Font.custom("Canterbury", size: 30))
                            .foregroundColor(Color.purple)
                            .fontWeight(.bold)
                    }.frame(width: 600)
                    HStack() {
                        GeometryReader { geometry in
                            TimeView(time : self.coreData.hour, type: "hour")
                        }
                        .frame(width: 360, height: 360)
                        
                        
                        
                        GeometryReader { geometry in
                            TimeView(time : self.coreData.minute, type: "minute")
                        }
                        .frame(width: 360, height: 360)
                    }
                }
                
            }
        }
        
        
    }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        TimeList()
            .environmentObject(CoreData())
            .environmentObject(Model(isLandscape: false))
        // .previewLayout(.fixed(width: 800, height: 500)) // iPhone SE landscape size
        
        
    }
}
#endif

struct TimeView: View {
    
    @EnvironmentObject var coreData : CoreData
    var time = 0
    var type = ""
    var image = "Illustration1"
    var shadowColor = Color("backgroundShadow3")
    var flag = true
    
    
    var body: some View {
        return VStack() {
            AnimatableColorText(from: UIColor.systemGray, to: UIColor.systemGray6, pct: (
                self.type == "hour" ? self.coreData.isHourChange :
                    self.coreData.isMinuteChange) ? 1 : 0) {
                        Text(self.time <= 9 ? "0\(self.time)" : "\(self.time)")
                            .font(Font.custom("Canterbury", size: 250))
                            .fontWeight(.heavy)
                        
            }
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .background(Color.gray)
        .cornerRadius(30)
        .frame(width: 360, height: 300)
        .shadow(color: Color.gray, radius: 10)
    }
}



