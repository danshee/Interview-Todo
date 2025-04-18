//
//  TodoViewModel.swift
//  Interview
//
//  Created by Daniel Pietsch on 4/17/25.
//

import Combine
import Foundation

fileprivate let urlString = "https://jsonplaceholder.typicode.com/todos/"

class TodoViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    enum State {
        case downloading
        case error(Error)
        case todos([Todo])
    }
    
    @Published private(set) var state = State.downloading
    
    func fetch() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        // WORKAROUND: There appears to be a bug in 18.4 so I am using ephemeral
        // as a workaround (see https://developer.apple.com/forums/thread/777999).
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        
        session.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .sink { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.state = .error(error)
                }
            } receiveValue: { [weak self] todos in
                self?.state = .todos(todos)
            }
            .store(in: &cancellables)
    }
}
