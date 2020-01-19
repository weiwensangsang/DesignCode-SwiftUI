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
    @Published var weekday: String
    @Published var isMinuteChange: Bool
    @Published var isHourChange: Bool
    @Published var font: String
    @Published var fontColor: UIColor
    @Published var fontBackgroundColor: UIColor
    @Published var light: Int
    @Published var isLock: Bool

    var timer = Timer()
    var mTimer = Timer()
    var hTimer = Timer()
    
    init() {
        func getDateComponents() -> DateComponents {
            let calendar = Calendar.current
            return calendar.dateComponents(in: TimeZone.current, from: Date())
        }
        
        func getCurrentDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy年MM月dd日"
            return dateFormatter.string(from: Date())
        }
        
        func revert(weekday : Int) -> String  {
            switch weekday {
            case 1:return "一"
            case 2:return "二"
            case 3:return "三"
            case 4:return "四"
            case 5:return "五"
            case 6:return "六"
            case 7:return "日"
            default:
                return "？"
            }
        }
        
        isMinuteChange = true
        isHourChange = true
        font = "Georgia"
        fontColor = UIColor.systemGray6
        fontBackgroundColor = UIColor.systemGray
        light = 50
        isLock = false
        let current = getDateComponents()
        hour = current.hour!
        minute = current.minute!
        weekday = revert(weekday: current.weekday!)
        currentDate = getCurrentDate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { _ in
            
            let current = getDateComponents()
            if (self.minute == current.minute!) {
                withAnimation(.easeInOut(duration: 2)) {
                    self.isMinuteChange.toggle()
                }
                
                self.mTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    self.minute = current.minute!
                    withAnimation(.easeInOut(duration: 2)) {
                        self.isMinuteChange.toggle()
                    }
                    self.mTimer.invalidate()
                }
            }
            
            if (self.hour != current.hour!) {
                self.currentDate = getCurrentDate()
                self.weekday = revert(weekday: current.weekday!)
                withAnimation(.easeInOut(duration: 2)) {
                    self.isHourChange.toggle()
                }
                
                self.hTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    self.hour = current.hour!
                    withAnimation(.easeInOut(duration: 2)) {
                        self.isHourChange.toggle()
                    }
                    self.hTimer.invalidate()
                }
            }
            
        })
    }
    
    func setFont(newFont: String) {
        self.font = newFont
    }
}
