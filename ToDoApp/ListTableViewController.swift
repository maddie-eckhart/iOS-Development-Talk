//
//  ListTableViewController.swift
//  ToDoApp
//
//  Created by Madeline Eckhart on 10/25/18.
//  Copyright © 2018 MaddGaming. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var list = ListItem.getTestData()
    
    @IBAction func btnAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        let alertText = UIAlertAction(title: "Done", style: .default) { (alertAction) in
            let itemTextField = alertController.textFields![0] as UITextField
            self.addToList(new_item: itemTextField.text!)
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField{ (nameTextField) in
            nameTextField.placeholder = "Enter Item"
        }
        
        alertController.addAction(alertText)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func addToList(new_item: String) {
        
        let newIndex = list.count
        list.append(ListItem(name:new_item))
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //------------------------------------------ TABLE VIEW FUNCTIONS ------------------------------------------- //
    
    // number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    // number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    // putting information into each cell in the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)

        if indexPath.row < list.count {
            let item = list[indexPath.row]
            cell.textLabel?.text = item.name
        }
        
        return cell
    }


    // deleting an item (this works now)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        list.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
