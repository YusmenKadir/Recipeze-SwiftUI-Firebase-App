//
//  VideoView.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 25.09.21.
//

import SwiftUI
import WebKit


struct VideoView: UIViewRepresentable {
    
    let videoUrl: String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youtubeUrl = URL(string: videoUrl) else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeUrl))
    }
}
