//
//  Memo.swift
//  MeMe
//
//  Created by 권정근 on 12/20/24.
//

import Foundation

// Memo 클래스 정의
class Memo: Codable {
    
    var id: String
    var date: Date
    var weather: String
    var title: String
    var content: String
    var category: String
    var image: [String]?

    init(id: String = UUID().uuidString, date: Date, weather: String, title: String, content: String, category: String, image: [String]? = nil) {
        self.id = id
        self.date = date
        self.weather = weather
        self.title = title
        self.content = content
        self.category = category
        self.image = image
    }
    
}
