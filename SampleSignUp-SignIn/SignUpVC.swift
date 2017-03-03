//
//  SignUpVC.swift
//  SampleSignUp-SignIn
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: @IBOutlet

    @IBOutlet weak var checkboxOutlet: UIButton!
    @IBOutlet weak var signInOutlet: UIButton!
    
    
    
    // MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    // MARK : @IBAction
    
        @IBAction func checkBoxAction(_ sender: UIButton) {
        
        checkboxOutlet.isSelected = !checkboxOutlet.isSelected

        }

}

    
        
    

