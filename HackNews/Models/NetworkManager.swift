//
//  NetworkManager.swift
//  HackNews
//
//  Created by Samuel Henrique on 5/30/21.
//

import Foundation

class NetworkManager: ObservableObject {
  
  @Published var posts = [Post]()
  
  func fetchData() {
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    if let url = URL(string: urlString) {
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: url) { data, response, error in
        if error == nil {
          let decoder = JSONDecoder()
          if let data = data {
            do {
              let results = try decoder.decode(Results.self, from: data)
              DispatchQueue.main.async {
                self.posts = results.hits
              }
            } catch {
              print(error)
            }
          }
        }
      }
      task.resume()
    }
  }
}
