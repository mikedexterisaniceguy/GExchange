//
//  OverviewView.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your stuff for exchange")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Spacer()
                
                NavigationLink {
                    CreatePositionView()
                } label: {
                    Text("Create a new position to exchange")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
