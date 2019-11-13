//
//  TableTableViewController.swift
//  TestTable
//
//  Created by Mati on 13/11/2019.
//  Copyright © 2019 Mati. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var vehicules: [[String]] = [
            ["car", "moto", "bicycle"], ["Patinete", "Barco", "monopatin"]
          ]
  var sections: [String] = ["vehicules1", "vehicules2"]
    
  // Variable para pasar de la actividad a la detailViewController:
    var value: String?
    
  override func viewDidLoad() {
        super.viewDidLoad()
  }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        
      return sections.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return vehicules[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,reuseIdentifier: "myCell")

      cell.textLabel?.text = vehicules[indexPath.section][indexPath.row]

        return cell
    }
    

  
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
      if sections[indexPath.section] != "vehicules2" {
        return true
      } else {
        return false
      }
    }
   
  func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int)-> String?{
     return self.sections[section]
   }

   // cette partie du compte est pour eviter que d'autres utilisateurs changent
  // Comment eliminer une cell sans eliminer l'autre:
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
          self.vehicules[indexPath.section].remove(at: indexPath.row)
          tableView.beginUpdates()
          tableView.deleteRows(at: [indexPath], with: .automatic)
          tableView.endUpdates()
        }
    }
     
    /*func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")

        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell

        valueToPass = currentCell.textLabel.text
        performSegueWithIdentifier("yourSegueIdentifer", sender: self)
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let indexPath = tableView.indexPathForSelectedRow!
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        value = cell.textLabel?.text
        print(value!)
        performSegue(withIdentifier: "mySegue", sender: self)
   }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("entra aqui")
        if (segue.identifier == "mySegue") {
            // initialize new view controller and cast it as your view controller
            let detailViewController = segue.destination as? DetailTableViewController

            // your new view controller should have property that will store passed value
            detailViewController!.receiveValue = value
            print(detailViewController!.receiveValue ?? value!)
        }
    }
  
}
