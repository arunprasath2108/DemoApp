//
//  HomePageViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 12/03/23.
//

import UIKit

class HomePageViewController: UIViewController {

    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        configureUI()
    }

    private func addSubView() {
        view.addSubview(tabBar.view)
    }
    private func configureUI() {
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.tabBar.backgroundColor = .systemBackground
        let vc1 = NewsFeedViewController()
        vc1.view.backgroundColor = .systemRed
        let vc2 = SearchViewController()
        vc2.view.backgroundColor = .systemGreen
        let vc3 = MyAccountViewController()
        vc3.view.backgroundColor = .systemBlue
        
        let item1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), tag: 0)
        let item2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let item3 = UITabBarItem(title: "My Account", image: UIImage(systemName: "person.circle"), tag: 2)
        
        vc1.tabBarItem = item1
        vc2.tabBarItem = item2
        vc3.tabBarItem = item3
        
        tabBar.viewControllers = [vc1, vc2, vc3]
        tabBar.view.frame = self.view.bounds
        
    }

}