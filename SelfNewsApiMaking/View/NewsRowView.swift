//
//  NewsRowView.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import SwiftUI

struct NewsRowView: View {
    
    @Environment(\.openURL) var openURL
    
    let news : News
    
    var body: some View {
        
            HStack {
                if let image = news.urlToImage {
                    ImageLoadingView(url: image, key: "\(news.id)")
                        .frame(width : 100, height : 100)
                        .padding(.horizontal)
                } else {
                    Circle()
                        .fill(.gray)
                        .frame(width : 100, height : 100)
                        .overlay(
                            Text("No Image")
                        )
                        .padding()
                }
                
                VStack(alignment : .leading){

                    Text(news.title)
                        .italic()
                        .lineLimit(2)
                        .padding(.bottom, 10)
                        
                    Text(news.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .italic()
                        .lineLimit(4)

                    Text("Source: \(news.source.name)")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.vertical, 10)
                        .lineLimit(1)
                    }
            }
            .padding(.horizontal)
            .onTapGesture {
                openURL(URL(string: news.url)!)
            }
            Divider()
    }
}

//struct NewsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRowView()
//    }
//}
