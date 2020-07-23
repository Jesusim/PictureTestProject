//
//  ListTableViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    fileprivate let network: NetworkService = .shared
    private var viewsItems = [String]()
    private var items = [Datum]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "List"
        loadNewItems()
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
