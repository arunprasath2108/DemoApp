//
//  TableViewCell.swift
//  DemoApp
//
//  Created by arun-pt6232 on 14/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

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
        dateLabel.font = .systemFont(ofSize: 10, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    
    private lazy var titleView: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.numberOfLines = 2
        title.backgroundColor = .systemGray4
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionView: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .left
        title.backgroundColor = .systemGreen
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
        addSubview(descriptionView)
        addSubview(optionButton)
    }
    
    private func configureUI() {
        configureImageView()
        configureDateLabel()
        configureTitleView()
        configureDescriptionView()
        configureMoreOptionsButton()
    }
    
    func setNews(news: News) {
        newsImageView.image = news.image
        postedDateLabel.text = news.postedDate
        titleView.text = news.title
        descriptionView.text = news.content
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            newsImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    private func configureDateLabel() {
        NSLayoutConstraint.activate([
            postedDateLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor),
            postedDateLabel.centerXAnchor.constraint(equalTo: newsImageView.centerXAnchor),
            postedDateLabel.widthAnchor.constraint(equalTo:  newsImageView.widthAnchor),
            postedDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func configureTitleView() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 5),
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureDescriptionView() {
        NSLayoutConstraint.activate([
            descriptionView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
    //            descriptionView.bottomAnchor.constraint(equalTo: optionButton.topAnchor),
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            descriptionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4)
    
        ])
    }
    
    private func configureMoreOptionsButton() {
        NSLayoutConstraint.activate([
            optionButton.topAnchor.constraint(equalTo: descriptionView.safeAreaLayoutGuide.bottomAnchor),
            optionButton.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor)
        ])
    }

}






