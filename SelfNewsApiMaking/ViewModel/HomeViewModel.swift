//
//  HomeViewModel.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import Combine

class NewsViewModel : ObservableObject {
    
    @Published var newsArray : NewsBody?
    
    let dataService = NewsDataService.instance
    var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        dataService.$news
            .sink { [weak self] (receiveModel) in
                DispatchQueue.main.async {
                    print(receiveModel)
                        self?.newsArray = receiveModel
                }
            }
            .store(in: &cancellable)
    }
}
