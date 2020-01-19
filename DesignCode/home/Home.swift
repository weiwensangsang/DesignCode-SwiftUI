//
//  Home.swift
//  DesignCode
//
//  Created by Mithun x on 7/12/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct Home: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject var coreData : CoreData
    @EnvironmentObject var vm : ViewModel
    
    
    @State var showMenuButton = true
    @State var show = false
    @State var showProfile = false
    @State var offset: CGSize = .zero

    
    var body: some View {
        
        ZStack(alignment: .top) {
            NumberCard()
                .background(Color.black)
                .environmentObject(self.coreData)
                .environmentObject(self.vm)
                .onTapGesture {
                    self.showMenuButton.toggle()
            } .offset(y: self.model.landscape ? 40 : 80)
            
            
            HStack {
                MenuButton(show: $show)
                    .offset(x: -40)
                    .opacity(self.showMenuButton ? 1 : 0)
                Spacer()
            }
            .offset(y: self.model.landscape ? 50 : 110)
            .animation(.spring())
            
            MenuView(show: $show)
                .offset(x: offset.width, y: 0)
                .environmentObject(self.coreData)
                .environmentObject(self.vm)
                .gesture(DragGesture()
                // When drag location is changed we recalculate offset for the rectangle
                .onChanged { value in
                    self.offset = value.translation
                }
                // When gesture ended we return the rectangle to the initial position
                .onEnded { _ in
                    if abs(self.offset.width) > 60 {
                        self.show.toggle()
                    }
                    self.offset = .zero
                })
            
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice("iPhone 11")
            .environmentObject(Model(isLandscape: false))
            .environmentObject(CoreData())
            .environmentObject(ViewModel())
    }
}
#endif

struct MenuRow: View {
    
    var image = "creditcard"
    var text = "My Account"
    var color = Color.red
    
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(color)
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var color: Color
}

let menuData = [
    Menu(title: "字体", icon: "a.square.fill", color: Color.black),
]

struct MenuView: View {
    
    var menu = menuData
    @Binding var show: Bool
    @State var showSettings = false
    @EnvironmentObject var coreData : CoreData
    @EnvironmentObject var vm : ViewModel
    
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    Button(action: { self.showSettings.toggle() }) {
                        MenuRow(image: item.icon, text: item.title, color: item.color)
                            .sheet(isPresented: self.$showSettings) { FontSettings().environmentObject(self.coreData).environmentObject(self.vm) }
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}


struct MenuButton: View {
    @Binding var show: Bool
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            Button(action: { self.show.toggle()  }) {
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
            Spacer()
        }
    }
}

