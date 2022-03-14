//
//  WebViewService.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    var url : String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {fatalError()}
        
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
    }
    //뉴스를 클릭할 경우 해당 url에 대한 웹뷰 조회시스템을 지원한다.
    //다음과 같이 시행한 후에 뷰에서 불러다가 사용하면 된다.
    //네비게이션 링크에 연동해서 사용이 가능하다 왜?(뷰니까)
}

