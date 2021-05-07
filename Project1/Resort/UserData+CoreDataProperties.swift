//
//  UserData+CoreDataProperties.swift
//  Resort
//
//  Created by admin on 5/3/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var food: NSSet?

}

// MARK: Generated accessors for food
extension UserData {

    @objc(addFoodObject:)
    @NSManaged public func addToFood(_ value: FoodFeedback)

    @objc(removeFoodObject:)
    @NSManaged public func removeFromFood(_ value: FoodFeedback)

    @objc(addFood:)
    @NSManaged public func addToFood(_ values: NSSet)

    @objc(removeFood:)
    @NSManaged public func removeFromFood(_ values: NSSet)

}

extension UserData : Identifiable {

}
