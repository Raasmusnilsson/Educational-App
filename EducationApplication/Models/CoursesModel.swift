//
//  CoursesModel.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import Foundation

struct CoursesModel : CoursesProtocol {
    var nameOfCourse: String
    var infoOfCourse: String
    var lengthOfCourse: Int
    
    init(nameOfCourse: String, infoOfCourse: String, lengthOfCourse: Int) {
        self.nameOfCourse = nameOfCourse
        self.infoOfCourse = infoOfCourse
        self.lengthOfCourse = lengthOfCourse
    }
}
