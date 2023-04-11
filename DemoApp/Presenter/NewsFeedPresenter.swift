//
//  NewsFeedPresenter.swift
//  DemoApp
//
//  Created by arun-pt6232 on 03/04/23.
//

import UIKit

class NewsFeedPresenter {
    
    let fetchNewsArticles = FetchNewsArticles()
    var newsArray: [News] = []
    
    
    func fetchNewsArticle(success: @escaping ([News]) -> Void, failure: @escaping (String) -> Void) {
        fetchNewsArticles.fetchNewsArticle { listOfArticle in
            
            for article in listOfArticle {
                
//                print("before parsing \(article.postedDate)")
//
////                let timeOrDate = checkDateToPresent(dateString: article.postedDate)
//                let (date, time): (String, String) = self.parseDateAndTime(dateString: article.postedDate, inputFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
//
//                print("after parsing date and time --> \(date)  : \(time)")
//
//
//                let dateToPresent = self.checkDateToPresent(inputDate: article.postedDate, dateString: date, timeString: time)
//                var finalDate = String()
//
//                if dateToPresent == "time" {
//                    finalDate = time
//                }
//                else if dateToPresent == "date" {
//                    let inputFormatter = DateFormatter()
//                    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                    if let date = inputFormatter.date(from: article.postedDate) {
//                        finalDate = self.parseDate(inputDate: date, outputFormat: "MMM d")
//                    }
//                }
//                else if dateToPresent == "yesterday" {
//                    finalDate = "yesterday"
//                }
//                else if dateToPresent == "date" {
//                    let inputFormatter = DateFormatter()
//                    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                    if let date = inputFormatter.date(from: article.postedDate) {
//                        finalDate = self.parseDate(inputDate: date, outputFormat: "MMM d")
//                    }
//                }
//                else {
//                    finalDate = "1234"
//                }
                let news = News(image: nil, imageURL: article.urlToImage!, postedDate: article.publishedAt! , source: (article.source?.name)!, title: article.title!, url: article.url!)
//                print(news.postedDate)
                self.newsArray.append(news)
            }
            success(self.newsArray)
            
        } failure: { error in
            failure(error)
        }
    }
    
    func getImage(articleURL: String, imageURL: String ,completion: @escaping (UIImage?) -> Void) {
        fetchNewsArticles.getImage(articleURL: articleURL, imageURL: imageURL) { image in
            completion(image)
        }
    }
    
    private func parseDateAndTime(dateString: String, inputFormat: String) -> (String, String) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        var parsedDate = String()
        var parsedTime = String()
        if let date = inputFormatter.date(from: dateString) {
            parsedDate = parseDate(inputDate: date, outputFormat: "dd-MM-yyyy")
            print(parsedDate)
            parsedTime = parseTime(inputDate: date, outputFormat: "h:mm a")
        }
        
        return (parsedDate, parsedTime)
    }
    
    
    private func parseDate(inputDate: Date, outputFormat: String) -> String {
        var parsedDate = String()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        parsedDate = dateFormatter.string(from: inputDate)
        
        return parsedDate
    }
    
    private func parseTime(inputDate: Date, outputFormat: String) -> String {
        var parsedTime = String()
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = outputFormat
        parsedTime = timeFormatter.string(from: inputDate)
        
        return parsedTime
    }
    
    private func getTodaysDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none

        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    private func getCurrentYear() -> String {
        let currentYear = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let yearString = dateFormatter.string(from: currentYear)
        return yearString
    }
    
    private func checkDateToPresent(inputDate: String, dateString: String, timeString: String) -> String {
    
        //yesterday, diff. year, else (Apr 04)
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd-MM-yyyy"
        let date = inputFormatter.date(from: dateString)
        
//        print("date-----> \(date)")
//        print("dateString -----> \(dateString)")
        if getTodaysDate() == dateString {
            return "time"
        }
        else if isYesterday(date: date!) {
            print("The given date is yesterday.")
            return "yesterday"
        }
        else {
            return "date"
        }
            
    }
    
    func isYesterday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        if calendar.isDateInYesterday(date) {
            // The given date is yesterday
            return true
        } else {
            // The given date is not yesterday
            return false
        }
    }
    
    
    
    //date styles
    //short -> 4/6/23
    //medium -> Apr 6, 2023
    //full -> Thursday, April 6, 2023
    //long -> April 6, 2023
    
}
