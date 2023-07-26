//
//  GoodsView.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI

struct GoodsView: View {
    
    @State private var items: [GoodsItem] = [
        GoodsItem(image: "house.fill", name: "puppet", category: .clothes, descriptin: "This is just a description for my List"),
        GoodsItem(image: "house.fill", name: "puppet", category: .clothes, descriptin: "This is just a description for my List"),
        GoodsItem(image: "house.fill", name: "puppet", category: .clothes, descriptin: "This is just a description for my List")
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                HStack {
                    Image(systemName: item.image)
                    VStack {
                        Text(item.name)
                        Text(item.descriptin)
                    }
                }
                
            }
        }
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodsView()
    }
}
