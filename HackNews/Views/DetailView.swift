//
//  DetailView.swift
//  HackNews
//
//  Created by Samuel Henrique on 5/30/21.
//

import SwiftUI
import WebKit

struct DetailView: View {
  
  let url: String?
  
  var body: some View {
    WebView(urlString: url)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(url: "https://google.com")
  }
}
