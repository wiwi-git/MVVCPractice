//
//  Article.swift
//  MVVMPractice_GoodNews
//
//  Created by Emoticbox on 2021/11/12.
//

import Foundation

struct Article: Decodable {
    let title: String?
    let description: String?
}

struct ArticleList: Decodable {
    let articles: [Article]
}
