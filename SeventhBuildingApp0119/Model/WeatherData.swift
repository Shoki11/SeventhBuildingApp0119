//
//  WeatherData.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/08/22.
//

import Foundation

struct WeatherData: Decodable {
    // 現在の気象データAPIの応答
    let current : Current
    
    struct Current : Decodable {
        /// 温度
        let temp : Double
        /// 大気圧 hPa
        let pressure : Int
    }
}

class Weather {
    /// apiから気圧と気温を取得
    static func getWeather() {
        guard var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/onecall") else {
            print("エラー")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "35.6989817597975"),
            URLQueryItem(name: "lon", value: "139.69661252650369"),
            URLQueryItem(name: "lang", value: "ja"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "6d51a05326461ff1631db5fe6396980c")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            do {
                let data = try JSONDecoder().decode(WeatherData.self, from: data!)
                // 呼び出す
                DispatchQueue.main.async {
                    HomeViewController.pressure = data.current.pressure
                    HomeViewController.temp = data.current.temp
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
