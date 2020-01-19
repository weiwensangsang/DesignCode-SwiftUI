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
        fetchSettings()
    }
    
    func fetchSettings () {
        self.settings = CoreDataManager.shared.getSettings()
    }
    
    func update(newfont: String){
        CoreDataManager.shared.update(newfont: newfont)
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
