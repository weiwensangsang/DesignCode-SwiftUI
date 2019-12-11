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

   @State var receive = false
   @State var number = 1
   @State var selection = 1
   @State var date = Date()
   @State var email = ""
   @State var submit = false
    var someData = ["a", "b", "c"]
   var body: some View {
      NavigationView {
         Form {
            
            Picker(selection: $selection, label: Text("Favourite course")) {
               Text("SwiftUI").tag(1)
               Text("React").tag(2)
            }
            
            Text("you picked: \(someData[picked])")

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
