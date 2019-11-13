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
 var receiveValue: String?
    
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label!.text = receiveValue
        print("Value: \(String(describing: label!.text))")
    
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//      if segue.identifier == "mySegue" {
//        label.text = receiveValue
//        print("Detail view controller: \(receiveValue!)")
//
//      }
//
//    }
   

}
