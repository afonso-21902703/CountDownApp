//
//  Event.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import Foundation

class Event {
    
    var title:String?
    var date:Date?
    
    init(title: String? = nil, date: Date? = nil) {
        self.title = title
        self.date = date
    }
}
