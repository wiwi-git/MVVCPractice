//
//  ArticleListViewModel.swift
//  MVVMPractice_GoodNews
//
//  Created by Emoticbox on 2021/11/12.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

struct ArticleViewModel {
    private let article: Article
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
    
    init(article: Article) {
        self.article = article
    }
    
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article: article)
    }
}
