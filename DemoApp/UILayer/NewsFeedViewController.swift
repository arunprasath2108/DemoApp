//
//  NewsFeedViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 12/03/23.
//

import UIKit

class NewsFeedViewController: UITableViewController {

    
    var datas: [News] = []
    
    private let reuseIdentifier = "NewsFeedCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 180
//        tableView.separatorStyle = .none
        datas = fetchData()
        print(datas.count)
    }
    
}

extension NewsFeedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
//        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        let index = datas[indexPath.row]
//        cell.setNews(news: index)
        return cell
    }

}

extension NewsFeedViewController {
    
    func fetchData() -> [News] {
        let news1 = News(image: UIImage(named: "Shopping")!, postedDate: "posted 8 days ago", title: "UK retail sales drop on weaker online shopping", content: "The drop in retail sales in November suggests that consumers are buckling under the pressure of surging... inflation, despite additional government support for their energy bills")
        
        let news2 = News(image: UIImage(named: "shopping2")!, postedDate: "posted 10 days ago", title: "Online Retailer Firms Ramp Up Delivery Workers' Hiring For Shopping Season", content: "India's e-commerce companies are adding delivery personnel at a rapid pace, fearing a labour shortage might cause them to lose out in one of the biggest annual shopping seasons that begins in earnest next month.")
        
        return [news1, news2]
    }
}
