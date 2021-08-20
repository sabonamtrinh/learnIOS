//
//  Employee+CoreDataProperties.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//
//

import Foundation
import CoreData

extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var hireDate: Date?
    @NSManaged public var identifier: String?
    @NSManaged public var isManager: Bool
    @NSManaged public var title: String?
    @NSManaged public var department: Department?

    static func insertNewEmployee(name: String, dateOfBirth: Date, hireDate: Date, identifier: String, isManager: Bool, title: String) -> Employee {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: AppDelegate.managedObjectContext!) as! Employee
        employee.name = name
        employee.dateOfBirth = dateOfBirth
        employee.hireDate = hireDate
        employee.identifier = identifier
        employee.isManager = isManager
        employee.title = title
        
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch  {
            let nserror = error as NSError
            print("Cannot insert a new Employee. Error is \(nserror), \(nserror.userInfo)")
        }
        print("Insert a new Employee with name: \(employee.name ?? "") successfully! ")
        return employee
    }
    
    static func fetchAllEmployees() -> [Employee] {
        var result = [Employee]()
        let moc = AppDelegate.managedObjectContext
        do {
            result = try moc?.fetch(Employee.fetchRequest()) as! [Employee]
        } catch  {
            print("Cannot fetch all employees. Error is \(error)")
            return result
        }
        return result
    }
    
    static func deleteAllEmployees() -> Bool {
        let moc = AppDelegate.managedObjectContext
        let employees = Employee.fetchAllEmployees()
        
        for employee in employees {
            moc?.delete(employee)
        }
        do {
            try moc?.save()
        } catch  {
            let nserror = error as NSError
            print("Cannot delete all employees. Error is \(nserror), \(nserror.userInfo)")
            return false
        }
        print("Delete all employees succcessfully!")
        return true
    }
    
    static func deleteEmployee(employee: Employee) {
        let moc = AppDelegate.managedObjectContext
        
        moc?.delete(employee)
        do {
            try moc?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot delete employee. Error is \(nserror), \(nserror.userInfo)")
        }
        print("Delete emloyee successfully!")
    }
    
    static func fetchEmployeeByDepartment(name: String) -> [Employee] {
        let moc = AppDelegate.managedObjectContext
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        employeesFetch.predicate = NSPredicate(format: "department.name = %@", name)
        do {
            let fetchedEmployees = try moc?.fetch(employeesFetch) as! [Employee]
            return fetchedEmployees
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
}
