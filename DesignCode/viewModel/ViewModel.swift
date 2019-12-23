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
    @Published var settings : Settings!

    init() {
        fetchAllOrder()
        fetchSettings()
    }
    
    func fetchAllOrder () {
        self.orders = CoreDataManager.shared.getAll().map(itemViewModel.init)
    }
    
    func fetchSettings () {
        self.settings = CoreDataManager.shared.getSettings()
    }
    
    func save(name: String, type : String){
        CoreDataManager.shared.save(name: name, type: type)
        self.orders = CoreDataManager.shared.getAll().map(itemViewModel.init)

    }
    
    func update(newfont: String){
        self.settings.font = newfont
        CoreDataManager.shared.update(s: self.settings)
        fetchSettings()

    }
}

class itemViewModel {
    var name = ""
    var type = ""
    
    init(settings: Settings) {
        self.name = settings.font!
    }
}
