//
//  HeightModel.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/23.
//

import UIKit
import CoreMotion

class Height {
    
    /// 高さを取得するメソッド
    /// - Parameters:
    ///   - nowPressure: 現在地の気圧
    ///   - pressure: 海面気圧
    ///   - temp: 気温
    private static func getHeight(nowPressure: Double, pressure: Int, temp: Double) -> Double{
        print("nowPressure\(nowPressure)")
        print("prresure\(pressure)")
        print("temp\(temp)")
        let temp1 = pow((Double(pressure) / nowPressure), (1 / 5.257)) - 1
        let temp2 = temp + 273.15
        let temp3 = temp1 * temp2
        print("height\(temp3 / 0.0065)")
        return temp3 / 0.0065
    }
    
    // 現在地の高さ取得
    private static func getNowHeight(height: Double) -> Int {
        print("nowHeight\(Int((height - 34.2) / 4.4))")
        print("nowHeight\((height - 34.2) / 4.4)")
        return Int((height - 34.2) / 4.4)
    }
    
    /// 現在のフロアを取得するメソッド
    /// - Parameters:
    ///   - nowPressure: 現在地の気圧
    ///   - pressure: 海面気圧
    ///   - temp: 気温
    static func getNowFloor(nowPressure: Double, pressure: Int, temp: Double) -> String {
        switch getNowHeight(height: getHeight(nowPressure: nowPressure, pressure: pressure, temp: temp)) {
        case -1:
            return "現在-2F"
        case 0:
            return "現在：-1F"
        case 1:
            return "現在：1F"
        case 2:
            return "現在：2F"
        case 3:
            return "現在：3F"
        case 4:
            return "現在：4F"
        case 5:
            return "現在：5F"
        case 6:
            return "現在：6F"
        case 7:
            return "現在：7F"
        case 8:
            return "現在：8F"
        case 9:
            return "現在：9F"
        case 10...20:
            return "現在：10F"
        default:
            return "情報を取得できませんでした"
        }
    }
    
}
