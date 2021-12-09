//
//  CustomTextField.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/22.
//

import UIKit

class CustomTextField: UITextField {
    
    // 左右の余白
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: -12, right: 10)
    
    // 下線用のUIView
    let underline: UIView = UIView()
    
    // 左のimage
    var leftImage: UIImageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpTextField()
        setUpTextFieldImage()
    }
    
    private func setUpTextField() {
        
        // textFieldの高さ
        self.frame.size.height = 50
        
        // 枠を消す
        self.borderStyle = .none
        
        // placeholder
        self.attributedPlaceholder = NSAttributedString(string: "PassWord",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        // x, yの位置指定は親要素,この場合はCustomTextFieldを基準にする
        underline.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 2.5)
        
        // 下線の色
        underline.backgroundColor = UIColor.basicColor
        
        self.addSubview(underline)
        self.bringSubviewToFront(underline)
        
    }
    
    private func setUpTextFieldImage() {

        leftImage.frame = CGRect(x: -5, y: 17, width: 30, height: 30)
        
        // imageを設定
        leftImage.image = UIImage(named: "key")
        
        // image適用
        self.addSubview(leftImage)
        self.bringSubviewToFront(leftImage)
    }
    
    // 入力されている文字の領域
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // placeholderを表示する領域
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // タップ等をして文字編集をした際に対応する領域
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
