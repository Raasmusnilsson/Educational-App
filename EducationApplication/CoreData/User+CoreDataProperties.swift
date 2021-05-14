//
//  User+CoreDataProperties.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-18.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var firstname: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: Int64?
    @NSManaged public var userId: Int64

}

extension User : Identifiable {

}
