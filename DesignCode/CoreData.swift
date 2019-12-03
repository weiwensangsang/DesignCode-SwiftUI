//
//  CoreData.swift
//  DesignCode
//
//  Created by zhen xia on 2019/12/2.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

class CoreData: ObservableObject {
    @Published var hour: Int
    @Published var minute: Int
    @Published var currentDate: String
    @Published var weekday: Int
    @Published var color: Color
    @Published var b: Bool

    var timer = Timer()
    
    
    init() {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(in: TimeZone.current, from: Date())
        let dateFormatter = DateFormatter() // 创建一个日期格式器
        b = true
        color = Color.white
        hour = dateComponents.hour!
        minute = dateComponents.minute!
        weekday = dateComponents.weekday!
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        currentDate = dateFormatter.string(from: Date())
        print("当前时间：\(dateFormatter.string(from: Date()))")
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { _ in
            print("\(self.hour)")
            withAnimation(.easeInOut(duration: 4)) {
                self.hour += 2
            }
        })
        
    }
    
    func play() {
        self.minute += 2
    }
    
    func colorChange() {
        self.color = Color.gray
    }
    
    
}
