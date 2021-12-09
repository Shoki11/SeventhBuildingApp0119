//
//  FloorData.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/20.
//

import Foundation

struct FloorData {
    let floor: String
    let subject: [String]
    let toilet: String
}

class Floor {
    
    static let floorList: [FloorData] = [
        FloorData(floor: "B2F",
                  subject: ["", Subject.subjectList[6].subject[0], ""],
                  toilet: "toilet")
        ,FloorData(floor: "B1F",
                   subject: [Subject.subjectList[10].subject[0], Subject.subjectList[2].subject[0], Subject.subjectList[3].subject[0]],
                   toilet: "toilet")
        ,FloorData(floor: "1F",
                   subject: [ "", Subject.subjectList[0].subject[0], ""],
                   toilet: "toilet")
        ,FloorData(floor: "2F",
                   subject: [Subject.subjectList[0].subject[2], Subject.subjectList[0].subject[3], ""],
                   toilet: "toilet")
        ,FloorData(floor: "3F",
                   subject: [Subject.subjectList[5].subject[0], Subject.subjectList[5].subject[1], Subject.subjectList[5].subject[2]],
                   toilet: "toilet")
        ,FloorData(floor: "4F",
                   subject: [Subject.subjectList[1].subject[1], Subject.subjectList[1].subject[0], Subject.subjectList[1].subject[2]],
                   toilet: "toilet")
        ,FloorData(floor: "5F",
                   subject: [Subject.subjectList[8].subject[0], Subject.subjectList[8].subject[1], ""],
                   toilet: "toilet_men")
        ,FloorData(floor: "6F",
                   subject: [Subject.subjectList[7].subject[0], Subject.subjectList[7].subject[1], Subject.subjectList[7].subject[2]],
                   toilet: "toilet_women")
        ,FloorData(floor: "7F",
                   subject: ["", Subject.subjectList[9].subject[0], ""],
                   toilet: "toilet_men")
        ,FloorData(floor: "8F",
                   subject: ["", Subject.subjectList[9].subject[1], ""],
                   toilet: "toilet_women")
        ,FloorData(floor: "9F",
                   subject: ["", Subject.subjectList[4].field, ""],
                   toilet: "toilet_men")
        ,FloorData(floor: "10F",
                   subject: ["", Subject.subjectList[0].subject[1], ""],
                   toilet: "")
    ]
    
}
