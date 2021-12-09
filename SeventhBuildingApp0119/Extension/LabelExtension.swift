//
//  LabelExtension.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/18.
//

import Foundation
import UIKit

extension UILabel {
    
    /// makeFloorLabel
    ///
    ///   - Parameters:
    ///   - strokeWidth: 線の太さ。負数
    ///   - oulineColor: 線の色
    ///   - foregroundColor: 縁取りの中の色
    func makeFloorLabel(strokeWidth: CGFloat, oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            .strokeColor : oulineColor,
            .foregroundColor : foregroundColor,
            .strokeWidth : strokeWidth,
            .font : self.font!
        ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
}
