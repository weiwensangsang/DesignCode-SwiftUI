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
    }
    
    func getAll() -> [Order] {
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = NSFetchRequest<Order>(entityName: "Order")
        do {
            orders = try self.moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        return orders
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
}
