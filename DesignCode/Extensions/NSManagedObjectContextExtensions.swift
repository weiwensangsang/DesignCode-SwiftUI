//
//  NSManagedObjectContextExtensions.swift
//  DesignCode
//
//  Created by zhen xia on 2019/12/22.
//  Copyright © 2019 Mithun. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current :NSManagedObjectContext {
        let appD = UIApplication.shared.delegate as! AppDelegate
        return appD.persistentContainer.viewContext
    }
}
