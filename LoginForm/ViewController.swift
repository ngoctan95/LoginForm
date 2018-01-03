//
//  ViewController.swift
//  LoginForm
//
//  Created by Tan on 1/3/18.
//  Copyright © 2018 Ngoc Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnDelAll(_ sender: Any) {
        arrayOfUsers.removeAll()
        self.showToast(message: "Delete all")
    }
    @IBAction func btnCheck(_ sender: Any) {
        guard txtUsername.text != nil, txtPassword.text != nil else {
            return
        }
        if checkExist(key: txtUsername!.text!){
            self.showToast(message: "Found")
        }
        else{
        self.showToast(message: "Cannot found")
        }
    }
    @IBAction func btnDeleteOne(_ sender: Any) {
        guard lblTextDelete.text != nil, checkExist(key: lblTextDelete.text!) else{
            self.showToast(message: "Empty or cannot be found")
            return
        }
        arrayOfUsers.removeValue(forKey: lblTextDelete.text!)
        self.showAllUser()
    }
    @IBAction func btnAddNewAct(_ sender: Any) {
        let alert = UIAlertController(title: "Add new", message: "Please fill all blank", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            
            textfield.placeholder = "Email"
        }
        alert.addTextField { (textfield) in
            textfield.placeholder = "Password"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textfield = alert?.textFields![0]
            let string = textfield?.text!
            let textf = alert?.textFields![1]
            let string1  = textf?.text!
             //print(string ?? "nil")
            self.arrayOfUsers[string!] = string1
            self.showAllUser()
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBOutlet weak var btnAddnew: UIButton!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var btnDeleteAll: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var lblTextDelete: UITextField!
    @IBOutlet weak var btnDeleteOne: UIButton!
    
    var arrayOfUsers = ["nguyenngoctan":"12345",
                        "phamhongthai":"123456",
                        "trannhatle":"1234567"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkExist(key : String) -> Bool {
       return arrayOfUsers[key] != nil
    }
    func showAllUser() {
        for user in arrayOfUsers{
            print(user.key)
            print(user.value)
            print(" -- ")
        }
    }

}

