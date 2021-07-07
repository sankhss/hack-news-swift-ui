//
//  WebView.swift
//  HackNews
//
//  Created by Samuel Henrique on 5/30/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  typealias UIViewType = WKWebView
  
  let urlString: String?
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    if let urlString = urlString {
      if let url = URL(string: urlString) {
        let request = URLRequest(url: url)
        uiView.load(request)
      }
    }
  }
}
