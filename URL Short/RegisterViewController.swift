//
//  RegisterViewController.swift
//  URL Short
//
//  Created by Jack Doherty on 6/11/17.
//  Copyright © 2017 Jack Doherty. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hitRegister(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: pass.text!) { (user, error) in
            if let error = error {
                //ADD ERROR CODE
                print(error.localizedDescription)
            } else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.name.text!
                changeRequest?.commitChanges { (error) in
                    if let error = error {
                        //ADD ERROR ALERT CODE
                        print(error.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: "registerToDashboard", sender: sender)
                    }
                }
            }
        }
    }

}
