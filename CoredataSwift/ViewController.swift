//
//  ViewController.swift
//  CoredataSwift
//
//  Created by koneti santhosh kumar on 16/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

   //Outlets
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    //save Action:
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        //store data : //
//        let appdel = UIApplication.shared.delegate  as? AppDelegate
//        let context = appdel?.persistentContainer.viewContext
                                   /* OR */
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    //insert data into Entity
    let data:UserInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: context) as! UserInformation
        
        //user Entered Data . it assign into entity
                 data.name = self.nameText.text
//OR//        data.setValue(self.nameText.text, forKey: "nameText")
                 data.setValue(self.passText.text, forKey: "password")
//or//          data.password = self.passText.text
  
        //save data
        do{
            try context.save()
            print("data Saved")
            self.nameText.text = ""
            self.passText.text = ""
            }
         catch
           {
            print(error)
           }
        
   }//button ends
    
}

