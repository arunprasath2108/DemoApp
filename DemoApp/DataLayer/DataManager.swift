//
//  DataManager.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation
import UIKit

class DataManager {
    
    let newsFeedNetworkService = NewsFeedNetworkService()
    let newsFeedDBController = NewsFeedDBController()
    
    func getNewsArticles(success: @escaping ([Article]) -> Void, failure: @escaping (String) -> Void) {
        
//        if(newsFeedDBController.) {
//
//        }
//        else {
            newsFeedNetworkService.getNewsArticle { articles in
                self.newsFeedDBController.addNews(articles: articles) { responseMessage in
                    if responseMessage == nil {
                        print("Can't save Article in DB")
                    }
                }
                success(articles)
            } failure: { error in
                failure(error)
            }
//        }
    }
    
    func getImage(articleURL: String, imageURL: String ,completion: @escaping (UIImage?) -> Void) {
        
        //        //db check
        //        if(true) {
        //
        //
        //        }
        //        else {
        
        newsFeedNetworkService.getImage(imageURL: imageURL) { image in
            
            self.newsFeedNetworkService.saveImageToFile(imageURL: imageURL, image: image!) { fileName in
                self.newsFeedDBController.addImage(articleURL: articleURL, imageName: fileName) { response in
                    if response == nil {
                        print("Can't save image name")
                    }
                }
            }
            completion(image)
        }
    }
    
    
                                                       
                                                       
}
                                                       
                                                       
