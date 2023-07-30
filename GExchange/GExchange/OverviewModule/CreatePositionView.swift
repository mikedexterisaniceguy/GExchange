//
//  CreatePositionView.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

@MainActor
final class CreatePositionViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var state: Int = 1
    @Published var isFavorite: Bool = false
    @Published var isUrgent: Bool = false
    
}

struct CreatePositionView: View {
    
    @StateObject private var viewModel = CreatePositionViewModel()
    
    var body: some View {
        VStack {
            Text("Create a new stuff position")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            
            Spacer()
            
            TextField("Enter position's name", text: $viewModel.name)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            TextField("Add description to your stuff", text: $viewModel.description)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Text("Rate the state of the stuff. From 1 to 10")
                .font(.title3)
            Picker(selection: $viewModel.state) {
                ForEach(1..<11) { rate in
                    Text("\(rate)")
                }
            } label: {
                Text("Picker")
            }
            
            Spacer()
            
            Button {
//                Task {
//                    do {
//                        try await viewModel.resetPassword()
//                        print("Reseted password")
//                    } catch {
//                        print(error)
//                    }
//                }
            } label: {
                Text("Create position")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CreatePositionView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePositionView()
    }
}
