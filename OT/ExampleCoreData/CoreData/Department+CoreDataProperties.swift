//
//  Department+CoreDataProperties.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var zipCode: Int32
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension Department {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Employee)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Employee)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)
    
    static func insertNewDepartment(address: String, city: String, name: String, zipCode: Int32) -> Department {
        let department = NSEntityDescription.insertNewObject(forEntityName: "Department", into: AppDelegate.managedObjectContext!) as! Department
        department.address = address
        department.city = city
        department.name = name
        department.zipCode = zipCode
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch  {
            let nserror = error as NSError
            print("Cannot insert a new department. Error is \(nserror), \(nserror.userInfo)")
        }
        print("Insert a new departmant with name \(department.name ?? "") successfully!")
        return department
    }
    
    static func fetchAllDepartments() -> [Department] {
        var result = [Department]()
        let moc = AppDelegate.managedObjectContext
        do {
            result = try moc?.fetch(Department.fetchRequest()) as! [Department]
        } catch  {
            print("Cannot fetch all departments. Error is \(error)")
            return result
        }
      
        return result
    }
    
    static func deleteAllDepartments() -> Bool {
        let moc = AppDelegate.managedObjectContext
        let departments = Department.fetchAllDepartments()
        
        for department in departments {
            moc?.delete(department)
        }
        do {
            try moc?.save()
        } catch  {
            let nserror = error as NSError
            print("Cannot delete all departments. Error is \(nserror), \(nserror.userInfo)")
            return false
        }
        print("Delete all departments succcessfully!")
        return true
    }

}

extension Department : Identifiable {

}
