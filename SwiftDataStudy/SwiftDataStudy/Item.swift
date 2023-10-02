//
//  Item.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 02/10/23.
//

import Foundation
import SwiftData

@Model
final class Item{
    @Attribute(.unique) var id = UUID()
    var timestamp: Date
    
    @Relationship(deleteRule: .cascade, inverse: \Palmeiras.item) var palmeiras: Palmeiras?
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class Palmeiras {
    @Attribute(.unique) var id = UUID()
    var item: Item?
    
    init(id: UUID = UUID(), item: Item? = nil) {
        self.id = id
        self.item = item
    }
}
