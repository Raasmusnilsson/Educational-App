//
//  CoursesProtocol.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import Foundation
enum courseStatusEnum : String {
    case Okänd = ""
    case Köpt = "Köpt"
    case Genomförd = "Genomförd"
    case Avslutad = "Avslutad"
    case Påbörjad = "Påbörjad"
    
}

protocol CoursesProtocol {
    var nameOfCourse: String {get set}
    var infoOfCourse: String {get set}
    var lengthOfCourse: Int {get set}
    var statusOfCourse: courseStatusEnum{get set}
    
}
