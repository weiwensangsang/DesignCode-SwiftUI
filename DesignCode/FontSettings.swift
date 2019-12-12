//
//  Settings.swift
//  DesignCode
//
//  Created by Mithun x on 7/15/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct FontSettings: View {
    @EnvironmentObject var coreData : CoreData
    
 
    var fonts = ["Canterbury", "Georgia"]
    
    var body: some View {
        let p = Binding<Int>(get: {
            return self.fonts.firstIndex(of: self.coreData.font)!
        }, set: {
            self.coreData.font = self.fonts[$0]
            
            // your callback goes here
            print("setting value \($0)")
        })
        return NavigationView {
            Form {
                
                Picker(selection: p,
                       label: Text("")) {
                        ForEach(0 ..< fonts.count) {
                            Text(self.fonts[$0]).tag($0)
                        }
                }
                .pickerStyle(WheelPickerStyle())
                Text("you picked: \(self.coreData.font)")
                
            }
            .navigationBarTitle("字体设置")
        }
    }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        FontSettings().environmentObject(CoreData()) }
}
#endif
