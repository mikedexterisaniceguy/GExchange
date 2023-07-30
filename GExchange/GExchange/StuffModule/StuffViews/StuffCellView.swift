//
//  StuffCellView.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

struct StuffCellView: View {
    
    let stuff: Stuff
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "star")
                .frame(width: 75, height: 75)
                .background(Color.accentColor)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            Text(stuff.name)
            Text(stuff.description)
            Spacer()
            VStack {
                Text("State: \(stuff.state)/10")
                stuff.isFavorite == true ? Image(systemName: "circle") : Image(systemName: "circle.fill")
                stuff.isUrgent == true ? Image(systemName: "rectangle") : Image(systemName: "rectangle.fill")
            }
        }
    }
}

struct StuffCellView_Previews: PreviewProvider {
    static var previews: some View {
        StuffCellView(stuff: Stuff(id: "12312", name: "Hat", description: "Brown hat for men", state: 7, isFavorite: false, isUrgent: true, owner: "Kirill", phoneNumber: "+375297285731"))
    }
}
