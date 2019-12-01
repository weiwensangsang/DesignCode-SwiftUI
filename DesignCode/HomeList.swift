//
//  HomeList.swift
//  DesignCode
//
//  Created by Mithun x on 7/13/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    var time = timeData
    @State var showContent = false
    
    var body: some View {
        VStack() {
            ForEach(time) { item in
                Button(action: { self.getTime() }) {
                    GeometryReader { geometry in
                        TimeView(title: item.title)
                    }
                    .frame(width: 360, height: 360)
                }
            }
        }
    }
    func getTime() {
        let date = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(in: TimeZone.current, from: date)
        print("\(dateComponents.year!)-\(dateComponents.month!)-\(dateComponents.day!)")
        let dateFormatter = DateFormatter() // 创建一个日期格式器
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前时间：\(dateFormatter.string(from: Date()))")

    }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()

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
    
    func getTime() {
        let dateFormatter = DateFormatter() // 创建一个日期格式器
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前时间：\(dateFormatter.string(from: Date()))")

    }
}

struct Time: Identifiable {
    var id = UUID()
    var title: String
}

let timeData = [
    Time(title: "00"),
    Time(title: "00"),
]


