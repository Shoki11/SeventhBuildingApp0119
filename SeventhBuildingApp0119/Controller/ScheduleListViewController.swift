//
//  ScheduleListViewController.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/15.
//

import UIKit
import CoreMotion

class ScheduleListViewController: UIViewController {
    
    @IBOutlet weak var scheduleListCollectionView: UICollectionView!
    @IBOutlet weak var nowFloorLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        setupSceduleListCollectionView(scheduleListCollectionView)
        Weather.getWeather()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: .sort, object: nil)
        
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
    
    /// SceduleListCollectionViewの設定
    private func setupSceduleListCollectionView(_ collectionView: UICollectionView) {
        
        collectionView.dataSource = self
        collectionView.delegate   = self
        
        collectionView.register(UINib(nibName: SortButtonCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: SortButtonCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: EventDetailCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: EventDetailCell.reuseIdentifier)
        
        collectionView.collectionViewLayout = createScheduleListViewLayout()
        collectionView.backgroundColor = .clear
        
    }
    
}

// MARK: - Layout
extension ScheduleListViewController {
    
    private enum ScheduleListSectionLayoutKind: CaseIterable {
        
        case sortButton
        case eventDetail
        
    }
    
    private func createScheduleListViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = ScheduleListSectionLayoutKind.allCases[sectionIndex]
            
            switch sectionLayoutKind {
            
            case .sortButton:
                return self.sortButtonSectionLayout()
                
            case .eventDetail:
                return self.eventDetailSectionLayout()
                
            }
            
        }
        
        return layout
        
    }
    
    private func sortButtonSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5 / 10))
        
        // countを2にすることで1行に2つカラムを表示
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        // 画面の両端スペース
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
        
    }
    
    private func eventDetailSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // width変えると横スクロールできる
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .fractionalHeight(0.88))
        
        // countを2にすることで1行に2つカラムを表示
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        // 個々のカラムのスペース
        let spacing = CGFloat(20)
        
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .continuous
        
        // 画面の両端スペース
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return section
        
    }
    
    @objc private func loadData(notification: Notification) {
        
        let data = notification.userInfo!["sortSubject"] as! String
        sortSubject(subject: data)
        
        self.scheduleListCollectionView.reloadData()
        
    }
    
    /// eventDataのsort
    private func sortSubject(subject: String) {
        if subject == "全学科" {
            Event.eventList = Event.cloneList
        } else {
            Event.eventList = []
            for sort in Event.cloneList {
                if sort.subject == subject {
                    Event.eventList.append(sort)
                }
            }
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension ScheduleListViewController: UICollectionViewDataSource {
    
    // sectionの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return ScheduleListSectionLayoutKind.allCases.count
        
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sectionLayoutKind = ScheduleListSectionLayoutKind.allCases[section]
        
        switch sectionLayoutKind {
        
        case .sortButton:
            return 1
            
        case .eventDetail:
            return Event.eventList.count
        }
        
    }
    
    /// セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionLayoutKind = ScheduleListSectionLayoutKind.allCases[indexPath.section]
        
        switch sectionLayoutKind {
        
        case .sortButton:
            
            let sortButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: SortButtonCell.reuseIdentifier, for: indexPath) as! SortButtonCell
            
            return sortButtonCell
            
        case .eventDetail:
            
            let eventDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: EventDetailCell.reuseIdentifier, for: indexPath) as! EventDetailCell
            
            eventDetailCell.setUpEventDetailCell(eventFloor: Event.eventList[indexPath.row].floor,
                                                 eventField: Event.eventList[indexPath.row].field,
                                                 eventSubject: Event.eventList[indexPath.row].subject,
                                                 eventStartTime: Event.eventList[indexPath.row].startTime,
                                                 eventDetail: Event.eventList[indexPath.row].detail,
                                                 floor: Event.eventList[indexPath.row].floorImage,
                                                 shadowColor: Event.eventList[indexPath.row].shadow)
            
            return eventDetailCell
            
        }
    }
}

// MARK: - UICollectionViewDelegate
extension ScheduleListViewController: UICollectionViewDelegate {
}


