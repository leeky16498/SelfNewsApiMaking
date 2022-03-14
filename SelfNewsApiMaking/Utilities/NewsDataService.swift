//
//  NewsDataService.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var news : NewsBody?
    
    static let instance = NewsDataService()
    
    var cancellable = Set<AnyCancellable>()
    
    func apiCall(text : String) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-02-12&sortBy=publishedAt&apiKey=f3ca7ffbf6294c20bd64db7ba5ff8d04")
                
        else {
            fatalError("Error to get url")
        }
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap(handleOutput)
            .decode(type: NewsBody.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("get error: \(error)")
                }
            } receiveValue: { [weak self] (returnedBody) in
                self?.news = returnedBody
            }
            .store(in: &cancellable)
    }
    
    func handleOutput(output : URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 &&
                response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
        return output.data
    }
}
