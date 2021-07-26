//
//  EmployeeViewController.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//

import UIKit

class EmployeeViewController: UIViewController {

    
    @IBOutlet weak var listEmployee: UITableView!
    
    var department: Department?
    var employees: [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listEmployee.delegate = self
        listEmployee.dataSource = self
        listEmployee.register(EmployeeTableViewCell.nib, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        updateUI()
        loadData()
    }
    
    func loadData(){
        if let department = department {
            employees = Employee.fetchEmployeeByDepartment(name: department.name ?? "")
        }
        
    }
    
    func updateUI() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add
                                        , target: self,
                                        action: #selector(handleAddBarButton))
        
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func handleAddBarButton() {
        let alert = UIAlertController(title: "New Employee", message: "Add new employee", preferredStyle: .alert)
        alert.addTextField { name in
            name.placeholder = "Name..."
        }
        alert.addTextField { id in
            id.placeholder = "Identifier..."
        }
        alert.addTextField { title in
            title.placeholder = "Title..."
        }
        alert.addAction(UIAlertAction(title: "Save", style: .destructive, handler: { (changePerson1) in
            guard let name = alert.textFields?[0].text,
                  let id = alert.textFields?[1].text,
                  let title = alert.textFields?[2].text else { return }
            
            let employee = Employee.insertNewEmployee(name: name, dateOfBirth: NSDate.calculateDate(day: 19, month: 12, year: 1999) as Date, hireDate: NSDate() as Date, identifier: id, isManager: false, title: title)
            employee.department = self.department
            self.department?.addToEmployees(employee)
            self.loadData()
            self.listEmployee.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension EmployeeViewController: UITableViewDelegate {
    
}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listEmployee.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        cell.nameLabel.text = employees?[indexPath.row].name
       // cell.dateOfBirthLabel.text = employees?[indexPath.row].dateOfBirth
        return cell
    }
    
    
}
