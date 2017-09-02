//
//  ViewController.swift
//  coredataexample
//
//  Created by Muhammed Esad Kaya on 02/09/2017.
//  Copyright © 2017 Muhammed Esad Kaya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let email = result.value(forKey: "email") as? String
                    {
                        print("****** email: \(email)")
                    }
                }
            }
        }
        catch
        {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerButton(_ sender: Any)
    {
  
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext

        let createUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        createUser.setValue(emailField.text, forKey: "email")
        createUser.setValue(passwordField.text, forKey: "password")
        
        do
        {
           try context.save()
            print("******** grats **********")
        }
        catch
        {
            print(error)
        }
        
    }

}

