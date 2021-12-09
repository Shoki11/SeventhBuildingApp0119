//
//  HomeViewController.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/15.
//

import UIKit
import CoreMotion

class HomeViewController: UIViewController {
    
    @IBOutlet weak var floorListCollectionView: UICollectionView!
    @IBOutlet weak var nowFloorLabel: UILabel!
    
    static let alitimeter = CMAltimeter()
    /// 気圧
    static var pressure = Int()
    /// 天気
    static var temp = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        setupFloorListCollectionView(floorListCollectionView)
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
            print{"高度が取得できません"}
        }
    }
    
    private func setUpTabBar() {
        // tabBarItemがタップされた時の色の変更
        UITabBar.appearance().tintColor = UIColor.greenColor
        // tabBarの上の線の設定
        self.tabBarController!.tabBar.layer.borderWidth = 1
        self.tabBarController!.tabBar.layer.borderColor = UIColor.basicColor.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
        
    }
    /// FloorListCollectionViewの設定
    private func setupFloorListCollectionView(_ collectionView: UICollectionView) {
        
        collectionView.dataSource = self
        collectionView.delegate   = self
        
        collectionView.register(UINib(nibName: FloorDetailCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: FloorDetailCell.reuseIdentifier)
        
        collectionView.collectionViewLayout = createFloorDetailCellLayout()
        collectionView.backgroundColor = .clear
        
    }
}

// MARK: - Layout
extension HomeViewController {
    
    private func createFloorDetailCellLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1 / 7))
        
        // countを2にすることで1行に2つカラムを表示
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        // 個々のカラムのスペース
        let spacing = CGFloat(20)
        
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing
        
        // 画面の両端スペース
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 30, bottom: 10, trailing: 30)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Floor.floorList.count
        
    }
    
    /// セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FloorDetailCell.reuseIdentifier, for: indexPath) as! FloorDetailCell
        
        cell.setUpFloorDetailCell(floor: Floor.floorList[indexPath.row].floor
                                  ,firstSubject: Floor.floorList[indexPath.row].subject[0]
                                  ,secondSubject: Floor.floorList[indexPath.row].subject[1]
                                  ,thirdSubject: Floor.floorList[indexPath.row].subject[2]
                                  ,toilet: Floor.floorList[indexPath.row].toilet)
        
        return cell
        
    }
    
    // セルがタップされたとき
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 遷移先のViewControllerを取得
        let FloorDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "FloorDetailViewController") as! FloorDetailViewController
        
        // 値をセット
        FloorDetailViewController.str = String(indexPath.row)
        
        // 遷移する
        self.present(FloorDetailViewController, animated: true, completion: nil)
        
    }
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
}

