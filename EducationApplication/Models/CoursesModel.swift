//
//  CoursesModel.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import Foundation

struct CoursesModel : CoursesProtocol {
    
    var statusOfCourse: courseStatusEnum
    var nameOfCourse: String
    var infoOfCourse: String
    var lengthOfCourse: Int
    
    
    init(nameOfCourse: String, infoOfCourse: String, lengthOfCourse: Int, statusOfCourse: courseStatusEnum) {
        self.nameOfCourse = nameOfCourse
        self.infoOfCourse = infoOfCourse
        self.lengthOfCourse = lengthOfCourse
        self.statusOfCourse = statusOfCourse
    }
}
