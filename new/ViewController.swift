//
//  ViewController.swift
//  new
//
//  Created by Sandip on 5/28/19.
//  Copyright © 2019 ShayonaPayal. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   // var list = ["one","two","three","four"]
    var list = [NSMutableDictionary]()//[["title":"one","selected":false],["title":"two","selected":false]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(tap))
        self.navigationItem.rightBarButtonItem = addButton
        for i in 0...30
        {
            let item : NSMutableDictionary = ["title" : String(i), "selected" : false]
//            list.updateValue(a, forKey: i)
            list.append(item)
            
           
        }
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAlertWithTextField(controller: UIViewController) {
        let alertController = UIAlertController(title: "Add new tag", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
//             self.list.updateValue(text, forKey:35)
          //      self.list.append(text)
                self.tableView.reloadData()
                
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Tag"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        controller.present(alertController, animated: true, completion: nil)
    }
  
    @objc func tap()
    {
        self.showAlertWithTextField(controller: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
//        var key   = Array(self.list.keys)[indexPath.row]
//        var value = Array(self.list.values)[indexPath.row]
//        cell.text = key + value
        let item = self.list[indexPath.row] as! [String:Any]
        print("item is = \(item)")
        cell.textLabel?.text = list[indexPath.row]["title"] as! String
        if item["selected"] as! Bool == true{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
       return cell
        }
  //*/  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     /*   if editingStyle == .delete {
           list.remove(at: <#T##Dictionary<Int, String>.Index#>)
            //self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }*/
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var item = self.list[indexPath.row]
         item["selected"] = !(item["selected"]as! Bool)
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item = self.list[indexPath.row]
        item["selected"] = !(item["selected"]as! Bool)
      
        return
        if let cell = tableView.cellForRow(at: indexPath) {
         
            cell.accessoryType = .checkmark
            
        }
    }
}


