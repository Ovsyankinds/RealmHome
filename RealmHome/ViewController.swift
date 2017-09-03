//
//  ViewController.swift
//  RealmHome
//
//  Created by Ovsyankinds on 03/09/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var text: UITextField!
    
    @IBAction func add(){
        var myModel = Model()
        myModel.name = text.text!
        let realm = try! Realm()
        try! realm.write{
            realm.add(myModel)
        }
    
    }
    
    @IBAction func show(){
        let realm = try! Realm()
        let result = realm.objects(Model.self)
        /*for row in result{
            print(row.name)
        }*/
    }
    
    var result: Results<Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result = try! Realm().objects(Model.self)
        //tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (result?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel!.text = result?[indexPath.row].name
            return cell
    }
}














