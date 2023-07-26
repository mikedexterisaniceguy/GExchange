//
//  GoodsModel.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import Foundation
import SwiftUI

struct GoodsItem: Hashable, Equatable {
    
    let image: String
    let name: String
    let category: Category
    let descriptin: String
    
    var id: String {
        name
    }
    
    static func == (lhs: GoodsItem, rhs: GoodsItem) -> Bool {
        lhs.id == rhs.id
    }
}
