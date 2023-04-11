//
//  NewsFeedViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 12/03/23.
//

//i

import UIKit

class NewsFeedViewController: UITableViewController {

    let newsFeedPresenter = NewsFeedPresenter()
    var datas: [News] = []
    private let reuseIdentifier = "NewsFeedCell"
    let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.addSubview(loadingIndicator)
        title = "News Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureLoadingIndicator()
        fetchNewsArticle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func fetchNewsArticle() {
        showLoadingIndicator()
        newsFeedPresenter.fetchNewsArticle { newsArticle in
            self.datas = newsArticle
            self.hideLoadingIndicator()
            self.tableView.reloadData()
        } failure: { error in
            print(error)
        }
    }
    
    func configureTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: reuseIdentifier)
//        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.rowHeight = 200
//        tableView.separatorStyle = .none
    }
    
    func configureLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.center = view.center
        loadingIndicator.color = .black
        loadingIndicator.hidesWhenStopped = true
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
    }
    
    func showLoadingIndicator() {
        loadingIndicator.startAnimating()
    }

    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
}

extension NewsFeedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCell
        let article = datas[indexPath.row]

        newsFeedPresenter.getImage(articleURL: article.url, imageURL: article.imageURL) { image in
            if let image = image {
                cell.setImage(image: image)
                cell.setNews(news: article)
//                cell.layoutIfNeeded()
            }
//            else {
//                cell.setImage(image: UIImage(named: "Shopping")!)
//                cell.setNews(news: article)
//            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let newsVC = NewsViewController(url: datas[indexPath.row].url)
        newsVC.modalPresentationStyle = .fullScreen
        newsVC.view.backgroundColor = .systemGray6
        navigationController?.pushViewController(newsVC, animated: true)
    }

}
