//
//  UsersViewModel.swift
//  Interview
//
//  Created by Daniel Pietsch on 4/17/25.
//

import Combine
import Foundation
import SwiftUICore

fileprivate let urlString = "https://jsonplaceholder.typicode.com/users/"

class UsersViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    enum State {
        case downloading
        case error(Error)
        case users([User])
    }
    
    @Published var state = State.downloading
    
    func fetch() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .sink { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.state = .error(error)
                }
            } receiveValue: { [weak self] users in
                self?.state = .users(users)
            }
            .store(in: &self.cancellables)
    }
}
