//
//  SubjectData.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/20.
//

import Foundation

struct SubjectData {
    
    let field: String
    let subject: [String]
    
}

class Subject {
    
    static let subjectList: [SubjectData] = [
        SubjectData(field: "", subject: ["受付", "留学生イベント", "自動販売機", "コミュニケーションスペース"]),
        SubjectData(field: "CG・映像分野", subject: ["コンピュータグラフィックス科", "CG映像製作科", "コンピュータグラフィックス研究科"]),
        SubjectData(field: "デザイン分野", subject: ["グラフィックデザイン科"]),
        SubjectData(field: "ビジネス分野", subject: ["情報ビジネスライセンス"]),
        SubjectData(field: "電気・電子分野", subject: ["高度電気工学科", "電気工学科", "電気工事技術科", "電子応用工学科"]),
        SubjectData(field: "ゲーム分野", subject: ["ゲーム制作研究科", "ゲーム制作科", "ゲーム企画科"]),
        SubjectData(field: "AI分野", subject: ["AIシステム科"]),
        SubjectData(field: "情報処理分野", subject: ["情報処理科", "情報システム開発科", "高度情報処理科"]),
        SubjectData(field: "アニメ分野", subject: ["アニメーション科", "アニメーション研究科"]),
        SubjectData(field: "Web・モバイル分野", subject: ["Webデザイン科", "ケータイ・アプリケーション科"]),
        SubjectData(field: "ネットワークせキュリティ分野", subject: ["ネットワークせキュリティ科"])
    ]
    
}
