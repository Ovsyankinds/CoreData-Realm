//
//  ViewController.swift
//  CoreData&Realm
//
//  Created by Ovsyankinds on 29/08/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var inputName: UITextField?
    @IBOutlet weak var inputSername: UITextField?
    @IBOutlet weak var inputAge: UITextField?
    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var sername: UILabel?
    @IBOutlet weak var age: UILabel?
    
    var array = [Person]()
    
    var object: NSManagedObjectContext!
    
    @IBAction func submitToDatabase(){
        let dbItem = Person(context: object)
        dbItem.name = inputName?.text!
        dbItem.sername = inputSername?.text!
        dbItem.age = Int16(inputAge!.text!)!
        
        do{
            try self.object.save()
        } catch{
            print("Not load data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = array[indexPath.row]
        cell.nameLabel!.text = person.name
        cell.sernameLabel!.text = person.sername
        cell.ageLabel!.text = person.sername
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        object = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        tableView.reloadData()
        
        do{
            let array = try object.fetch(request)
            
            /*name?.text = array[0]
            sername?.text = array[1]
            age?.text = String(describing: array[2])*/
            
            /*for row in result{
                print(row.name! , row.sername!, row.age)
            }*/
            
        } catch{
            print("Not reques data")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

