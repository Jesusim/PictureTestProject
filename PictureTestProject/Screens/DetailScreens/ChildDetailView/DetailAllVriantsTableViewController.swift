//
//  DetailAllVriantsTableViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class DetailAllVriantsTableViewController: UITableViewController, SetDetailView {

    private var variants = [Variant]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var cellIdentifierString = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifierString)
    }
    
    func setData(data: DataClass?) {
        guard let newVariants = data?.variants else { return }
        variants = newVariants
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return variants.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierString, for: indexPath)

        cell.textLabel?.text = variants[indexPath.row].text
        cell.detailTextLabel?.text = "\(variants[indexPath.row].id)"

        return cell
    }

}
