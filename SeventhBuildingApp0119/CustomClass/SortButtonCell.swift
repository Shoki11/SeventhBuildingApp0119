//
//  SortButtonCell.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/19.
//

import UIKit

class SortButtonCell: UICollectionViewCell {
    
    @IBOutlet weak var sortButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func sort(_ sender: Any) {
        
        let items = UIMenu(options: .displayInline, children: [
            
            UIAction(title: "全学科", handler: { _ in
                self.sortButton.setTitle("全学科", for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":"全学科"])
            }),
            UIAction(title: Subject.subjectList[1].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[1].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[1].subject[0]])
            }),
            UIAction(title: Subject.subjectList[1].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[1].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[1].subject[1]])
            }),
            UIAction(title: Subject.subjectList[1].subject[2], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[1].subject[2], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[1].subject[2]])
            }),
            
            UIAction(title: Subject.subjectList[2].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[2].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[2].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[3].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[3].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[3].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[4].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[4].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[4].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[4].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[4].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[4].subject[1]])
            }),
            
            UIAction(title: Subject.subjectList[4].subject[2], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[4].subject[2], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[4].subject[2]])
            }),
            
            UIAction(title: Subject.subjectList[4].subject[3], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[4].subject[3], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[4].subject[3]])
            }),
            
            UIAction(title: Subject.subjectList[5].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[5].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[5].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[5].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[5].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[5].subject[1]])
            }),
            
            UIAction(title: Subject.subjectList[5].subject[2], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[5].subject[2], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[5].subject[2]])
            }),
            
            UIAction(title: Subject.subjectList[6].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[6].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[6].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[7].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[7].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[7].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[7].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[7].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[7].subject[1]])
            }),
            
            UIAction(title: Subject.subjectList[7].subject[2], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[7].subject[2], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[7].subject[2]])
            }),
            
            UIAction(title: Subject.subjectList[8].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[8].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[8].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[8].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[8].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[8].subject[1]])
            }),
            
            UIAction(title: Subject.subjectList[9].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[9].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[9].subject[0]])
            }),
            
            UIAction(title: Subject.subjectList[9].subject[1], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[9].subject[1], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[9].subject[1]])
            }),
            
            UIAction(title: Subject.subjectList[10].subject[0], handler: { _ in
                self.sortButton.setTitle(Subject.subjectList[10].subject[0], for: .normal)
                NotificationCenter.default.post(name: .sort, object: nil, userInfo: ["sortSubject":Subject.subjectList[10].subject[0]])
            }),
            
        ])

        sortButton.menu = UIMenu(title: "", children: [items])
        sortButton.showsMenuAsPrimaryAction = true
    }
}
