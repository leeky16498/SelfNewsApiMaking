//
//  HomeView.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = NewsViewModel()
    
    let dataService = NewsDataService.instance
    
    init() {
        dataService.apiCall(text: "today")
    }
    
    var body: some View {
        NavigationView {
        
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Divider()
                    if let newsArray = vm.newsArray?.articles {
                        ForEach(newsArray) { news in
                            NewsRowView(news: news)
                        }
                }
            }
        }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
