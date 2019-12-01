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
                Button(action: { self.showContent.toggle() }) {
                    GeometryReader { geometry in
                        TimeView(title: item.title)
                    }
                    .frame(width: 360, height: 360)
                }
            }
        }
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
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack() {
            Text(title)
                .font(Font.custom("Canterbury", size: 200))
                .fontWeight(.heavy)
                
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()

                
            Spacer()
            
        }
        .background(Color.gray)
        .cornerRadius(30)
        .frame(width: 360, height: 360)
        .shadow(color: Color.gray, radius: 10)
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
