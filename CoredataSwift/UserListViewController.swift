//
//  UserListViewController.swift
//  CoredataSwift
//
//  Created by koneti santhosh kumar on 16/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

import UIKit
import CoreData


class UserListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    //array declaration type entity
    var listArray : [UserInformation] = [ ]
    
    @IBOutlet weak var userListTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //get data
        self.fetchdata()
        
        //reload tableview
        self.userListTableview.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.userListTableview.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//get data
        func fetchdata(){
       let  context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
//  Request
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInformation")
//  save data
        do{
            let list = try context?.fetch(fetchRequest)
            self.listArray = list as! [UserInformation]
           }
           catch
           {
            print(error)
          }
}//end fetchData func
    
    
//tableview Methods
    
/*number of rows in the section*/
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listArray.count
    }

/*cell For Row At indexPath */
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil
        {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cellID")
        }
       
        let data:UserInformation = listArray[indexPath.row]
        cell?.textLabel?.text = data.name
        return cell!
    }

    //navigate other view controller :  method: didselectRoeAt idexPath
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let storybd : UIStoryboard = UIStoryboard.init(name:"Main", bundle:nil)
        let editVC : EditViewController = storybd.instantiateViewController(withIdentifier:"EditViewController") as! EditViewController
        let data : UserInformation = listArray[indexPath.row]
       editVC.editUserData = data
        
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    
    // Delete row : Method : commit Editing Style
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            
             let context : NSManagedObjectContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
            
             let data : UserInformation = listArray[indexPath.row]
             context.delete(data)
            
              listArray.remove(at: indexPath.row)
              self.userListTableview.reloadData()
              do{
                try context.save()
                 }
                 catch
                      {
                         print(error)
                      }//end catch
        }// end if statement : editing style
        
    }//end func style
    
}
