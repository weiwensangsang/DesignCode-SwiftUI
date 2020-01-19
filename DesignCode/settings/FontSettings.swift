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
    @EnvironmentObject var vm : ViewModel
    
    var fonts = ["Canterbury", "Georgia"]
    
    var body: some View {
        let p = Binding<Int>(get: {
            
            return self.fonts.firstIndex(of: self.vm.settings.font ?? self.changeValue(newValue: "Canterbury"))!

        }, set: {
            self.changeValue(newValue: self.fonts[$0])
        })
        return NavigationView {
            Form {
                
                Picker(selection: p,
                       label: Text("字体")) {
                        ForEach(0 ..< fonts.count) {
                            Text(self.fonts[$0]).tag($0)
                        }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .navigationBarTitle("字体设置")
        }
    }
    
    func changeValue(newValue: String) -> String{
        self.vm.settings.font = newValue
        self.vm.update(newfont: newValue)
        return newValue
    }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        FontSettings().environmentObject(CoreData()).environmentObject(ViewModel()) }
}
#endif
