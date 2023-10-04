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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
