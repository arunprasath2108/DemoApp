//
//  NewsFeedDBController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation

class NewsFeedDBController {
    
    
    func addNews(articles: [Article], completion: @escaping (String?) -> Void) {
        
        let tableName = DBConstant.NEWS_FEED_TABLE
        for article in articles {
            let columns = [
                DBConstant.ARTICLE_TITLE : article.title,
                DBConstant.ARTICLE_SOURCE : (article.source?.name),
                DBConstant.PUBLISHED_AT : article.publishedAt,
                DBConstant.ARTICLE_URL : article.url,
            ]
            
            if !DBConnector.shared.insert(tableName: tableName,
                                          values: columns as [String : Any]) {
                completion(nil)
                return
            }
            completion("Added Successfully")
        }
    }
    
    func addImage(articleURL: String, imageName: String, completion: @escaping (String?) -> Void) {
        let tableName = DBConstant.NEWS_FEED_TABLE
        if !DBConnector.shared.update(tableName: tableName,
                                      values: (DBConstant.ARTICLE_IMAGE_NAME, imageName),
                                      whereClause: (DBConstant.ARTICLE_URL, articleURL)) {
            completion(nil)
        }
        else {
            completion("Added Successfully")
        }

    }
    
    
}

