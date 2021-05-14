//
//  Courses+CoreDataProperties.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-18.
//
//

import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses")
    }

    @NSManaged public var infoOfCourse: String?
    @NSManaged public var lengthOfCourse: Int16
    @NSManaged public var nameOfCourse: String?
    @NSManaged public var statusOfCourse: String?

}

extension Courses : Identifiable {

}
