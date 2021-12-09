//
//  FloorDetailCell.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/19.
//

import UIKit

class FloorDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var topFloorSubjectLabel: UILabel!
    @IBOutlet weak var centerFloorSubjectLabel: UILabel!
    @IBOutlet weak var bottomFloorSubjectLabel: UILabel!
    @IBOutlet weak var toiletImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupFloorDetailCellLayerLayout()
        floorLabel.makeFloorLabel(strokeWidth: 5, oulineColor: .gray, foregroundColor: .white)
        
    }
    
    func setUpFloorDetailCell(floor: String, firstSubject: String, secondSubject: String, thirdSubject: String, toilet: String) {
        floorLabel.text = floor
        topFloorSubjectLabel.text = firstSubject
        centerFloorSubjectLabel.text = secondSubject
        bottomFloorSubjectLabel.text = thirdSubject
        toiletImageView.image = UIImage(named: toilet)
    }
    
    private func setupFloorDetailCellLayerLayout() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.mainColor.cgColor
        layer.masksToBounds = false
        layer.shadowRadius  = 1
        layer.shadowOpacity = 0.7
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: 1)
    }
    
}
