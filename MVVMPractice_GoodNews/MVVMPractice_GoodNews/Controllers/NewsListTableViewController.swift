//
//  NewsListTableViewController.swift
//  MVVMPractice_GoodNews
//
//  Created by Emoticbox on 2021/11/12.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
        DispatchQueue.global().async {
            WebService().getArticles(url: url) {
                if let articles = $0 {
                    self.articleListViewModel = ArticleListViewModel(articles: articles)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        else {
            fatalError("no matched articleTableViewCell identifier")
        }
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.descriptionLabel.text = articleViewModel.description
        cell.titleLabel.text = articleViewModel.title
        return cell
        
    }
}
