//
//  EditViewController.swift
//  CoredataSwift
//
//  Created by koneti santhosh kumar on 17/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

import UIKit


class EditViewController: UIViewController
{
 //declare variable - for bring data from UserListViewController via navigation
    var editUserData = UserInformation()
    
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameText.text = editUserData.name
        self.passText.text = editUserData.password

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Update data and save
    @IBAction func saveBtn(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        editUserData.name = self.nameText.text
        editUserData.password = self.passText.text
        do{
            try context?.save()
        }
        catch{
            print(error)
        }
    }//end saveBtn 
    
}
