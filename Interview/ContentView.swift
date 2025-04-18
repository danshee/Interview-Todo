//
//  ContentView.swift
//  Interview
//
//  Created by Daniel Pietsch on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    
    var body: some View {
        NavigationView {
            switch self.viewModel.state {
            case .downloading:
                ProgressView()
            case .error(let error):
                ContentUnavailableView("Error", systemImage: "x.circle.fill", description: Text(error.localizedDescription))
            case .todos(let todos):
                List(todos) { todo in
                    Text(todo.title)
                }
            }
        }
        .onAppear {
            self.viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
