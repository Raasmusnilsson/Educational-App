//
//  User+CoreDataProperties.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-19.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstname: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var username: String?
    @NSManaged public var favouritelist: NSSet?

}

// MARK: Generated accessors for favouritelist
extension User {

    @objc(addFavouritelistObject:)
    @NSManaged public func addToFavouritelist(_ value: Courses)

    @objc(removeFavouritelistObject:)
    @NSManaged public func removeFromFavouritelist(_ value: Courses)

    @objc(addFavouritelist:)
    @NSManaged public func addToFavouritelist(_ values: NSSet)

    @objc(removeFavouritelist:)
    @NSManaged public func removeFromFavouritelist(_ values: NSSet)

}

extension User : Identifiable {

}
