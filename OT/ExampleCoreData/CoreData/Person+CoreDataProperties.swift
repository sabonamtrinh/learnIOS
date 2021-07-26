//
//  Person+CoreDataProperties.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateOfBirth: Date?

}

extension Person : Identifiable {

}
