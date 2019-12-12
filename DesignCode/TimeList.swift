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
                    
                    Button(action: {  self.coreData.minute+=1 }) {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "list.dash")
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing, 18)
                        .frame(width: 90, height: 60)
                        .background(Color("button"))
                        .cornerRadius(30)
                        .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
                    }

                    Text(self.coreData.currentDate)
                        .font(Font.custom(self.coreData.font, size: 30))
                        .foregroundColor(Color(self.coreData.fontColor))
                        .fontWeight(.bold)
                        .frame(width: 360, height:40, alignment: .bottomTrailing)
                    
                    Text("周" + self.coreData.weekday)
                        .font(Font.custom(self.coreData.font, size: 28))
                        .foregroundColor(Color(self.coreData.fontColor))
                        .fontWeight(.heavy)
                        .frame(width: 360, height:50, alignment: .bottomTrailing)
                    
                    GeometryReader { geometry in
                        TimeView(time : self.coreData.hour, type: "hour")
                    }
                    .frame(width: 360, height: 300)
                    
                    
                    
                    GeometryReader { geometry in
                        TimeView(time : self.coreData.minute, type: "minute")
                    }
                    .frame(width: 360, height: 300)
                    
                }
                
                
            } else {
                VStack() {
                    HStack() {
                        Text("周" + self.coreData.weekday)
                            .font(Font.custom(self.coreData.font, size: 28))
                            .foregroundColor(Color(self.coreData.fontColor))
                            .fontWeight(.heavy)
                        
                        Spacer()
                        Text(self.coreData.currentDate)
                            .font(Font.custom(self.coreData.font, size: 30))
                            .foregroundColor(Color(self.coreData.fontColor))
                            .fontWeight(.bold)
                    }.frame(width: 600)
                    HStack() {
                        GeometryReader { geometry in
                            TimeView(time : self.coreData.hour, type: "hour")
                        }
                        .frame(width: 360, height: 300)
                        
                        
                        
                        GeometryReader { geometry in
                            TimeView(time : self.coreData.minute, type: "minute")
                        }
                        .frame(width: 360, height: 300)
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
            AnimatableColorText(from: self.coreData.fontBackgroundColor, to: self.coreData.fontColor, pct: (
                self.type == "hour" ? self.coreData.isHourChange :
                    self.coreData.isMinuteChange) ? 1 : 0) {
                        Text(self.time <= 9 ? "0\(self.time)" : "\(self.time)")
                            .font(Font.custom(self.coreData.font, size: 250))
                            .fontWeight(.heavy)
                        
            }
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .background(Color(self.coreData.fontBackgroundColor))
        .cornerRadius(30)
        .frame(width: 360, height: 300)
        .shadow(color: Color.gray, radius: 10)
    }
}



