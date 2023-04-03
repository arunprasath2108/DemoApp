//
//  NewsFeedNetworkService.swift
//  DemoApp
//
//  Created by arun-pt6232 on 21/03/23.
//

import Foundation

class NewsFeedNetworkService {
    
    
    func getNewsData() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d41250fef91d4968ab796085856f902f"
        let url = NSMutableURLRequest(url: URL(string: urlString)!)


        guard url !=  nil else {
            print("URL is nil")
            return
        }

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url as URLRequest) {
            (data, response, error) in
            if error == nil && data != nil {
                //parse JSON
                let decoder = JSONDecoder()
                do {
                    let newsFeed = try! decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                }
            }
        }
        dataTask.resume()
    }
    
}
