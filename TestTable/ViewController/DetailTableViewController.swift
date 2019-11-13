//
//  DetailTableViewController.swift
//  TestTable
//
//  Created by Mati on 13/11/2019.
//  Copyright © 2019 Mati. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController {

  @IBOutlet var label: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "mySegue" {
        let tableViewController = segue.destination as! TableViewController
        
      }
      
    }
   

}
