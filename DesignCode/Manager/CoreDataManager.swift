//
//  CoreDataManager.swift
//  DesignCode
//
//  Created by zhen xia on 2019/12/22.
//  Copyright © 2019 Mithun. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc :NSManagedObjectContext.current)
    
    var moc : NSManagedObjectContext
    private init(moc :NSManagedObjectContext) {
        self.moc = moc
        let settingsRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            if(try self.moc.fetch(settingsRequest).count == 0 ) {
                let settings = Settings(context: self.moc)
                //var orders = [Order]()
                // let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
                
                settings.font = "Canterbury"
                    try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func getAll() -> [Settings] {
        var settings = [Settings]()
        let orderRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            settings = try self.moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        return settings
    }
    
    func getSettings() -> Settings {
        var settings = Settings(context: self.moc)
        let settingsRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            settings = try self.moc.fetch(settingsRequest)[0]
        } catch let error as NSError {
            print(error)
        }
        return settings
    }
    
    func save(name: String, type : String){
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        //var orders = [Order]()
        // let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
        //return orders
    }
    
    func update(s: Settings){
        var settings = Settings(context: self.moc)
        let settingsRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            settings = try self.moc.fetch(settingsRequest)[0]
            settings.font = s.font
            try self.moc.save()

        } catch let error as NSError {
            print(error)
        }
    
    }
}
