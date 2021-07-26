//
//  DemoCoreDataViewController.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//

import UIKit

class DemoCoreDataViewController: UIViewController {

    @IBOutlet weak var listDepartmentTableView: UITableView!
    
    var departments: [Department]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Department"
        listDepartmentTableView.delegate = self
        listDepartmentTableView.dataSource = self
        listDepartmentTableView.register(DepartmentTableViewCell.nib, forCellReuseIdentifier: DepartmentTableViewCell.identifier)
        
        updateUI()
        loadData()
    }

    func updateUI() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add
                                        , target: self,
                                        action: #selector(handleAddBarButton))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func loadData() {
        departments = Department.fetchAllDepartments()
    }

    @objc func handleAddBarButton() {
        let alert = UIAlertController(title: "New Department", message: "Add new department", preferredStyle: .alert)
        alert.addTextField { name in
            name.placeholder = "Name..."
        }
        alert.addTextField { city in
            city.placeholder = "City..."
        }
        alert.addTextField { address in
            address.placeholder = "Address..."
        }
        alert.addTextField { zipcode in
            zipcode.placeholder = "Zipcode..."
        }
        alert.addAction(UIAlertAction(title: "Save", style: .destructive, handler: { (changePerson1) in
            guard let name = alert.textFields?[0].text,
                  let city = alert.textFields?[1].text,
                  let address = alert.textFields?[2].text,
                  let zipcode = alert.textFields?[3].text else { return }
            
            let department = Department.insertNewDepartment(address: address, city: city, name: name, zipCode: Int32(zipcode)!)
            self.departments?.append(department)
            self.loadData()
            self.listDepartmentTableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension DemoCoreDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listDepartmentTableView.dequeueReusableCell(withIdentifier:
                                                                DepartmentTableViewCell.identifier, for: indexPath) as! DepartmentTableViewCell
        cell.nameLabel.text = departments?[indexPath.row].name
        cell.addressLabel.text = departments?[indexPath.row].address
        cell.cityLabel.text = departments?[indexPath.row].city
        cell.zipcodeLabel.text = String(departments?[indexPath.row].zipCode ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension DemoCoreDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = EmployeeViewController()
        guard let departments = departments else {
            return
        }
        screen.department = departments[indexPath.row]
        self.navigationController?.pushViewController(screen, animated: true)
    }
}
