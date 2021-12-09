//
//  SharedCMMotionManager.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/23.
//

import CoreMotion

class SharedCMMotionManager {
    
    // シングルトンではこれをstaticにする
    static let shared = SharedCMMotionManager().manager

    private let manager: CMMotionManager
    
    // シングルトンは他所から絶対に使わせないようにinitをprivateにする
    private init() {
        
        manager = CMMotionManager()
        
    }
    
}

