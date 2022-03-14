//
//  ImageLoadingView.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import SwiftUI

struct ImageLoadingView: View {
    
    @StateObject var loader : ImageLoadingViewModel
    @State var isLoading : Bool = false
    
    init(url : String, key : String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

//struct ImageLoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageLoadingView()
//    }
//}
