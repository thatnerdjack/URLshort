//
//  ViewController.swift
//  URL Short
//
//  Created by Jack Doherty on 6/11/17.
//  Copyright © 2017 Jack Doherty. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            //code for when auth state changes
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    //IBActions
    
    @IBAction func UILoginHit(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { (user, error) in
            //code
        }
    }
    @IBAction func UIRegisterHIt(_ sender: Any) {
        //code
    }
    
}

//finished on signing in existing users, making view controllers, and starting registration
