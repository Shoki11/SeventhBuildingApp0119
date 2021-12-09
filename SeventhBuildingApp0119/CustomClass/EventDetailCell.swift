//
//  EventDetailCell.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/18.
//

import UIKit

class EventDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var eventFloorLabel: UILabel!
    @IBOutlet weak var eventFieldLabel: UILabel!
    @IBOutlet weak var eventSubjectLabel: UILabel!
    @IBOutlet weak var eventStartTimeLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    @IBOutlet weak var floorImageView: UIImageView!
    @IBOutlet weak var backGround: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        eventFloorLabel.makeFloorLabel(strokeWidth: 3, oulineColor: .black, foregroundColor: .white)
        
    }
    
    func setUpEventDetailCell(eventFloor: String, eventField: String, eventSubject: String, eventStartTime: String, eventDetail: String, floor: String, shadowColor: UIColor) {
        floorImageView.layer.cornerRadius = 10
        backGround.layer.masksToBounds = true
        backGround.layer.cornerRadius = 10
        backGround.layer.backgroundColor = UIColor.mainColor.cgColor
        backGround.layer.masksToBounds = false
        backGround.layer.shadowRadius  = 3
        backGround.layer.shadowOpacity = 0.7
        backGround.layer.shadowColor   = shadowColor.cgColor
        backGround.layer.shadowOffset  = CGSize(width: 1, height: 1)
        eventFloorLabel.text = eventFloor
        eventFieldLabel.text = eventField
        eventSubjectLabel.text = eventSubject
        eventStartTimeLabel.text = eventStartTime
        eventDetailLabel.text = eventDetail
        floorImageView.image = UIImage(named: floor)
        setupFloorDetailCellLayerLayout(shadowColor: shadowColor)
    }
    
    private func setupFloorDetailCellLayerLayout(shadowColor: UIColor) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.mainColor.cgColor
        layer.masksToBounds = false
        layer.shadowRadius  = 3
        layer.shadowOpacity = 0.7
        layer.shadowColor   = shadowColor.cgColor
        layer.shadowOffset  = CGSize(width: -1, height: -1)
    }

}
