//
//  TableViewController.swift
//  Proyecto_Final
//
//  Created by Daniela Diaz on 4/16/18.
//  Copyright © 2018 Daniela Diaz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var imagenes_abecedario = [#imageLiteral(resourceName: "a"), #imageLiteral(resourceName: "b"), #imageLiteral(resourceName: "c"), #imageLiteral(resourceName: "d"),#imageLiteral(resourceName: "e"), #imageLiteral(resourceName: "f"), #imageLiteral(resourceName: "g"), #imageLiteral(resourceName: "h"), #imageLiteral(resourceName: "i"), #imageLiteral(resourceName: "l"), #imageLiteral(resourceName: "m"), #imageLiteral(resourceName: "n"), #imageLiteral(resourceName: "o"), #imageLiteral(resourceName: "p"), #imageLiteral(resourceName: "r"), #imageLiteral(resourceName: "s"), #imageLiteral(resourceName: "t"), #imageLiteral(resourceName: "u"), #imageLiteral(resourceName: "v"), #imageLiteral(resourceName: "w"), #imageLiteral(resourceName: "y")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagenes_abecedario.count + 7
    }
/*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell_image", for: indexPath)
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell_video", for: indexPath)
        
        if cell1 =
        

        // Configure the cell...

        return cell1
    }
*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
