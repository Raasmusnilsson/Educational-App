//
//  Courses+CoreDataProperties.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-19.
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
    @NSManaged public var counter: Int64
    @NSManaged public var category: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension Courses {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension Courses : Identifiable {

}
