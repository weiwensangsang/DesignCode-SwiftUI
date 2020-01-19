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
                settings.font = "Canterbury"
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func getSettings() -> Settings {
        var settings = Settings(context: self.moc)
        let settingsRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            let short = try self.moc.fetch(settingsRequest)
            settings = short[0]
            
        } catch let error as NSError {
            print(error)
        }
        return settings
    }
    
    func update(newfont: String){
        var settings = Settings(context: self.moc)
        let settingsRequest: NSFetchRequest<Settings> = NSFetchRequest<Settings>(entityName: "Settings")
        do {
            settings = try self.moc.fetch(settingsRequest)[0]
            settings.font = newfont
            try self.moc.save()
            
        } catch let error as NSError {
            print(error)
        }
        
    }
}
