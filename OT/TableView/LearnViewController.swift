//
//  LearnViewController.swift
//  OT
//
//  Created by namtrinh on 19/07/2021.
//

import UIKit

class LearnViewController: UIViewController {

    @IBOutlet weak var listMoviesTableView: UITableView!
    
    let movies: [[String]] = [["A Hoà", "A Hoàng", "A Huy","Anh","Anh Tuan","Anh Hai"],
                            ["B Nam","B Hue","B Son","B Quang","Ban Tuan"],
                            ["Cau Bac","Chung","Cuong","ChungB","CuongB"],
                            ["Em","Em gai","Em Lien","Em Trang"]]
    var titles = ["A","B","C","E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listMoviesTableView.delegate = self
        listMoviesTableView.dataSource = self
        listMoviesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        listMoviesTableView.showsLargeContentViewer = true
       
    }

}

extension LearnViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row: \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension LearnViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listMoviesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = movies[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titles
    }
}
