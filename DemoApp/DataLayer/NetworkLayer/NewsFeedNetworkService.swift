//
//  NewsFeedNetworkService.swift
//  DemoApp
//
//  Created by arun-pt6232 on 21/03/23.
//

import Foundation
import UIKit

class NewsFeedNetworkService {
    
    var parser = Parser()
    var network = Network()
    
    func getNewsArticle(success: @escaping ([Article]) -> Void, failure: @escaping (String) -> Void) {
        
        let query = "everything?q=shopping&sortBy=publishedAt&from=2023-04-07&to=2023-04-10&pageSize=10&lang=en"
        let urlString = Network.newsBaseURL + query + "&apiKey=" + Network.newsAPIKey
        
        network.performDataTask(urlString: urlString) { data,errorMessage in
            if let data = data {
                self.parser.parseNewsArticle(data: data) { newsFeed in
                    success(newsFeed.articles)
                } failure: { error in
                    failure(error)
                }
            }
            else {
                failure(errorMessage)
            }
        }
    }
    
    func getImage(imageURL: String, completion: @escaping (UIImage?)->Void) {
        
        network.performDataTask(urlString: imageURL) { data, errorMessage in
            if errorMessage != "" {
                print(errorMessage)
                completion(nil)
            }
            guard let data = data else {
                completion(nil)
                return
            }
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error in downloading image from data")
                completion(nil)
            }
        }
    }
    
    func saveImageToFile(imageURL: String, image: UIImage, imageName: @escaping (String) -> Void) {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
            let fileName = "\(getImageName(from: imageURL)).jpg"

            if let imageData = image.jpegData(compressionQuality: 1.0) {
                let fileURL = documentsDirectory.appendingPathComponent(fileName)

                do {
                    try imageData.write(to: fileURL)
//                    print("Image \(fileName) saved successfully.")
                    imageName(fileName)
                } catch {
                    print("Error saving image \(fileName): \(error.localizedDescription)")
                }
            }
    }
    
    private func getImageName(from imageURL: String) -> String {
        let splitArray = imageURL.split(separator: "/")
        return String(splitArray.last!)
    }
    
    
}
