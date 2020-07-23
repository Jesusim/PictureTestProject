//
//  ListTableViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

final class ListTableViewController: UITableViewController {
    
    fileprivate let network: NetworkService = .shared
    private var viewsItems = [String]()
    private var items = [Datum]()
    
    override func loadView() {
        super.loadView()
        
        loadNewItems()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = StringResources.titleOfList
    }
    
    private func loadNewItems() {
        
        network.getTypesToView { (newTypesToView, error) in
            
            if error != nil {
                print(error!)
            }
            
            guard let typesToView = newTypesToView else {
                return
            }
            self.viewsItems = typesToView.view
            self.items = typesToView.data
            
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewsItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemToView = items.filter({ $0.name == viewsItems[indexPath.row] })
        
        return setType(tableView: tableView, indexPath: indexPath, filterData: itemToView)
        
    }
    
    // MARK: - Set Cell in TableView
    private func setType(tableView: UITableView, indexPath: IndexPath, filterData: [Datum]) -> UITableViewCell {
        
        for item in filterData {
            
            let cellIdentifier = switchType(index: indexPath.row)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TextTableViewCell
            cell.identifier = cellIdentifier
            cell.configure(data: item.data)
            return cell
           
        }
        return UITableViewCell()
    }
    
    private func switchType(index: Int) -> String {
        switch viewsItems[index] {
        case "hz":
            return "CellText"
        case "picture":
            return "CellPicture"
        case "selector":
            return "CellSelector"
        default:
            return "CellText"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TextTableViewCell
        
        performSegue(withIdentifier: "nextPage", sender: (cell?.data, cell?.identifier))
    }
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextPage" {
            let detailVC = segue.destination as? DetailViewController
            let some =  sender as? (DataClass, String)
            detailVC?.data = some?.0
            detailVC?.identifier = some?.1
        }
    }

}
