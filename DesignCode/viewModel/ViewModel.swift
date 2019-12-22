//
//  ViewModel.swift
//  DesignCode
//
//  Created by zhen xia on 2019/12/22.
//  Copyright © 2019 Mithun. All rights reserved.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var orders = [itemViewModel]()
    
    init() {
        fetchAllOrder()
    }
    
    func fetchAllOrder () {
        self.orders = CoreDataManager.shared.getAll().map(itemViewModel.init)
    }
    
    func save(name: String, type : String){
        CoreDataManager.shared.save(name: name, type: type)
        self.orders = CoreDataManager.shared.getAll().map(itemViewModel.init)

    }
}

class itemViewModel {
    var name = ""
    var type = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
