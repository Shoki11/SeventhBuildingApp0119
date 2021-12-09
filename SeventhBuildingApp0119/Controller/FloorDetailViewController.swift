//
//  FloorDetailViewController.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/15.
//

import UIKit
import CoreMotion

class FloorDetailViewController: UIViewController {
    
    @IBOutlet weak var floorDetailImageView: UIImageView!
    @IBOutlet weak var nowFloorLabel: UILabel!
    
    var str = ""
    private let floorList = ["B2F", "B1F", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floorDetailImageView.image = UIImage(named: floorList[Int(str)!])
        Weather.getWeather()
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            HomeViewController.alitimeter.startRelativeAltitudeUpdates(to: OperationQueue.current!) { (data, error) in
                if error == nil {
                    if data != nil {
                        // ここで気圧取得
                        let nowPressure = Double(truncating: data!.pressure) * 10
                        // 現在のフロア
                        self.nowFloorLabel.text = Height.getNowFloor(nowPressure: nowPressure, pressure: HomeViewController.pressure, temp: HomeViewController.temp)
                    } else {
                        print("data is nil")
                    }
                } else {
                    print(error!)
                }
            }
        } else {
            self.nowFloorLabel.text = "高度が取得できません"
            print{"高度が取得できません"}
        }
        
    }
    
    
    
    
}
