//
//  CoursesDelegate.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import Foundation

protocol CoursesDelegate: class {
   // func update(task: CoursesModel, index: Int)
    func save(courses: CoursesModel)
    // Courses var det innan. 
}
