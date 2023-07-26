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
            ZStack {
                Color.accentColor
                Text("Text")
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            VStack(alignment: .leading) {
                                                Text("GExchange")
                                    .font(.title)
                                    .fontWeight(.bold)
                                                Text("You are in Braslav")
                                    .font(.subheadline)
                                            }
                                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                
                            } label: {
                                Color.red
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                        }
                        }
                        
                    }
            }
            .padding(.top, 10)
        }
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
