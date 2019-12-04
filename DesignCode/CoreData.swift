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
    @Published var isOn: Bool

    var timer = Timer()
    var cTimer = Timer()

    
    
    init() {
        func getDateComponents() -> DateComponents {
            let calendar = Calendar.current
            return calendar.dateComponents(in: TimeZone.current, from: Date())
        }
        
        func getCurrentDate() -> String {
            let dateFormatter = DateFormatter() // 创建一个日期格式器
            dateFormatter.dateFormat = "yyyy年MM月dd日"
            return dateFormatter.string(from: Date())
        }
        
        isOn = true
        let dateComponents = getDateComponents()
        hour = dateComponents.hour!
        minute = dateComponents.minute!
        weekday = dateComponents.weekday!
        currentDate = getCurrentDate()
        var count = 1;
        
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { _ in
            
            let current = getDateComponents()
            if (self.minute == current.minute!) {
                withAnimation(.easeInOut(duration: 2)) {
                    self.isOn.toggle()
                }
                self.minute = current.minute!
                count+=1
                print("\(count)")
                
                self.cTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    withAnimation(.easeInOut(duration: 2)) {
                        self.isOn.toggle()
                    }
                    self.cTimer.invalidate()
                }
                
                
            }
            
        })
        
        
        
    }
    
    func play() {
        self.minute += 2
    }
    

    
    
}
