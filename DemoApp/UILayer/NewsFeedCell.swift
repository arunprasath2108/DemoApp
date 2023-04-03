//
//  TableViewCell.swift
//  DemoApp
//
//  Created by arun-pt6232 on 14/03/23.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postedDateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = .systemFont(ofSize: 13, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    
    private lazy var titleView: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.numberOfLines = 3
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var optionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        addSubview(newsImageView)
        addSubview(postedDateLabel)
        addSubview(titleView)
        addSubview(optionButton)
    }
    
    private func configureUI() {
        configureImageView()
        configureDateLabel()
        configureTitleView()
        configureMoreOptionsButton()
    }
    
    func setNews(news: News) {
        newsImageView.image = news.image
        postedDateLabel.text = news.postedDate
        titleView.text = news.title
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1.5),
            newsImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.5),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            newsImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
           
        ])
    }
    
    private func configureDateLabel() {
        NSLayoutConstraint.activate([
            postedDateLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            postedDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            postedDateLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor)
        ])
    }
    
    private func configureTitleView() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            titleView.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 10),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureMoreOptionsButton() {
        NSLayoutConstraint.activate([
            optionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            optionButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
    }

}






