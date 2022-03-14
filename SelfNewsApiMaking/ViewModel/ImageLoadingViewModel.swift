//
//  ImageLoadingViewModel.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel : ObservableObject {
    
    @Published var image : UIImage? = nil
    @Published var isLoading : Bool = false
    
    var cancellable = Set<AnyCancellable>()
    
    let urlString : String
    let imageKey : String
    
    let manager = PhotoManager.instance
    
    init(url : String, key : String) {
        imageKey = key
        urlString = url
        getImage()
    }
    
    func downloadImage() {
        
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self,
                      let image = returnedImage else {return}
                self.image = returnedImage
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellable)
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("getting savedImage")
        } else {
            downloadImage()
            print("Downloading Images")
        }
    }
    
}
