//
//  WebService.swift
//  MVVMPractice_GoodNews
//
//  Created by Emoticbox on 2021/11/12.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                print(articleList)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
