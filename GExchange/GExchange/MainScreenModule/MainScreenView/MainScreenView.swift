//
//  MainView.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var selectTabView: Int = 0
    
    var body: some View {
        TabView(selection: $selectTabView) {
            OverviewView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            Text("Goods")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Goods")
                }
                .tag(1)
            Text("My goods")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("My goods")
                }
                .tag(2)
            Text("Settings")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
