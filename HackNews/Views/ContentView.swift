//
//  ContentView.swift
//  HackNews
//
//  Created by Samuel Henrique on 5/30/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var networkManager = NetworkManager()
  
  var body: some View {
    NavigationView {
      List(networkManager.posts) { post in
        let stack = HStack {
          Text("\(post.points)")
          Text(post.title)
        }
        if let url = post.url {
          NavigationLink(
            destination: DetailView(url: url),
            label: {
              stack
            })
        } else {
          stack
        }
      }
      .navigationBarTitle("Hack News")
    }
    .onAppear(perform: {
      networkManager.fetchData()
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
