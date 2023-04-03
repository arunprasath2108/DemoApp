//
//  NewsFeedViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 12/03/23.
//

//i

import UIKit

class NewsFeedViewController: UITableViewController {

    
    var datas: [News] = []
    
    private let reuseIdentifier = "NewsFeedCell"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        title = "abcdhjm nj"
//        setTableView()
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        datas = fetchData()
//        setHeader()
    }
    
}

extension NewsFeedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCell
        let index = datas[indexPath.row]
        cell.setNews(news: index)
        return cell
    }
    
    func setHeader() {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        view.addSubview(header)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What's\nNew"
        label.font = .systemFont(ofSize: 50, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .systemRed
        label.numberOfLines = 2
        header.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: header.safeAreaLayoutGuide.topAnchor, constant: 20)
            
        ])
        tableView.tableHeaderView = header
    }
    
//    func setTableView() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }

}

//extension NewsFeedViewController {
//
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            tableView.rowHeight = 200
//        }
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            tableView.rowHeight = 260
//        }
//    }
//}

extension NewsFeedViewController {
    
    func fetchData() -> [News] {
        let news1 = News(image: UIImage(named: "Shopping")!, postedDate: "08:30 pm . BBC", title: "Spotify Still Intends to Launch Delayed HiFi Lossless Plan, Just Don't Ask When")
        
        let news2 = News(image: UIImage(named: "shopping2")!, postedDate: "10:15 am . The Times of India", title: "Online Retailer Firms Ramp Up Delivery Workers' Hiring For Shopping Season")
        
        let news3 = News(image: UIImage(named: "Shopping")!, postedDate: "07:15 pm . The Guardian", title: "Ted Lasso season three review – still so charming it brings order to our crumbling universe")
        
        let news4 = News(image: UIImage(named: "shopping2")!, postedDate: "10:15 am . The Times of India", title: "Online Retailer Firms Ramp Up Delivery Workers' Hiring For Shopping Season")
        
        let news5 = News(image: UIImage(named: "Shopping")!, postedDate: "08:30 pm . BBC", title: "Spotify Still Intends to Launch Delayed HiFi Lossless Plan, Just Don't Ask When")
        
        let news6 = News(image: UIImage(named: "shopping2")!, postedDate: "10:15 am . The Times of India", title: "Online Retailer Firms Ramp Up Delivery Workers' Hiring For Shopping Season")
        
        let news7 = News(image: UIImage(named: "Shopping")!, postedDate: "08:30 pm . BBC", title: "UK retail sales drop on weaker online shopping")
        
        let news8 = News(image: UIImage(named: "shopping2")!, postedDate: "10:15 am . The Times of India", title: "Online Retailer Firms Ramp Up Delivery Workers' Hiring For Shopping Season")
        
        return [news1, news2, news3, news4, news5, news6, news7, news8]
    }
}
