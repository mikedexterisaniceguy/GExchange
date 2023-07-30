//
//  StuffView.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

@MainActor

final class StuffViewModel: ObservableObject {
    
    @Published private(set) var stuff: [Stuff] = []
    @Published var selectedFilter: FilterOption? = nil
    
    func getAllStuff() async throws {
        self.stuff = try await StuffManager.shared.getAllStuff()
    }
    
    enum FilterOption: String, CaseIterable {
        case noFilter
        case stateHigh
        case stateLow
    }
    
    func filterSelected(option: FilterOption) async throws {
        switch option {
        case .noFilter:
            self.stuff = try await StuffManager.shared.getAllStuff()
        case .stateHigh:
            self.stuff = try await StuffManager.shared.getAllStuffSortedByState(descending: true)
            break
        case .stateLow:
            self.stuff = try await StuffManager.shared.getAllStuffSortedByState(descending: false)
            break
        }
        self.selectedFilter = option
    }
    
}

struct StuffView: View {
    
    @StateObject private var viewModel = StuffViewModel()
    
    var body: some View {
        VStack {
            Text("Available stuff")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            
            List(viewModel.stuff) { stuff in
                StuffCellView(stuff: stuff)
            }
//            Spacer()
            
            Menu("Filter: \(viewModel.selectedFilter?.rawValue ?? "NONE")") {
                ForEach(StuffViewModel.FilterOption.allCases, id: \.self) { filterOption in
                    Button(filterOption.rawValue) {
                        Task {
                            try? await viewModel.filterSelected(option: filterOption)
                        }
                    }
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
        .task {
            try? await viewModel.getAllStuff()
        }
        
    }
}

struct StuffView_Previews: PreviewProvider {
    static var previews: some View {
        
        StuffView()
        
    }
}
