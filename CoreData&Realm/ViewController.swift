//
//  ViewController.swift
//  CoreData&Realm
//
//  Created by Ovsyankinds on 29/08/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var inputName: UITextField?
    @IBOutlet weak var inputSername: UITextField?
    @IBOutlet weak var inputAge: UITextField?
    @IBOutlet weak var tableView: UITableView!
    
    var array = [Person]()
    
    var object: NSManagedObjectContext!
    
    @IBAction func submitToDatabase(){
        let dbItem = Person(context: object)
        dbItem.name = inputName?.text!
        dbItem.sername = inputSername?.text!
        dbItem.age = Int16(inputAge!.text!)!
        
        do{
            try self.object.save()
            tableView.reloadData()
        } catch{
            print("Not load data")
        }
    }
    
    /*@IBAction func deleteIntoDatabas(){
        object(UIApplication.shared.delegate as! AppDelegate)
        object.delete()
        do{
            try self.managedObjectContext.save
        }catch{}
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*tableView.delegate.self
        tableView.DataSource.self*/
        object = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        //tableView.reloadData()
        
        do{
            array = try object.fetch(request)
            tableView.reloadData()
            //let result = try object.fetch(request)
            
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

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        let person = array[indexPath.row]
        cell.nameLabel!.text = person.name
        cell.sernameLabel!.text = person.sername
        cell.ageLabel!.text = String(person.age)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        object = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let user = array[indexPath.row]
            object.delete(user)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                try object.fetch(Person.fetchRequest())
            }catch{}
            
        }
        
        tableView.reloadData()
    }
    
    
    
    
}

