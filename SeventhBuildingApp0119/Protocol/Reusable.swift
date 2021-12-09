//
//  Reusable.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/19.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NSObject: Reusable {}
