//
//  MainVC.swift
//  SampleSignUp-SignIn
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: @IBOutlet
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var scrollViewOutlet: UIScrollView!

    // MARK: PROPERTY
    
    // MARK: LIFE CYCLE
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollViewOutlet.frame = CGRect( x: 0 , y: 243 , width : self.view.frame.width , height: 325)
        
        let signInVc = self.storyboard?.instantiateViewController(withIdentifier: "SignInSID") as! SignInVC
        let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSID") as! SignUpVC
        
        self.addChildViewController(signInVc)
        self.addChildViewController(signUpVc)

        signInVc.didMove(toParentViewController: self)
        signUpVc.didMove(toParentViewController: self)

        signInVc.view.frame = CGRect(x: 0 , y: 0 , width : self.scrollViewOutlet.frame.width, height: 325)
        signUpVc.view.frame = CGRect(x: self.scrollViewOutlet.frame.width , y: 0 , width : self.scrollViewOutlet.frame.width, height: 325)

        self.scrollViewOutlet.addSubview((signInVc.view)!)
        self.scrollViewOutlet.addSubview((signUpVc.view)!)
        
        self.scrollViewOutlet.contentSize = CGSize(width: (self.scrollViewOutlet.frame.width) * 2, height: self.scrollViewOutlet.frame.height)
        
        scrollViewOutlet.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        scrollViewOutlet.contentOffset.x = 0
    }
    

    @IBAction func signUp(_ sender: UIButton) {
        
        scrollViewOutlet.contentOffset.x = self.scrollViewOutlet.frame.width
    }
    

    
}

extension MainVC : UIScrollViewDelegate{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let multi = self.scrollViewOutlet.frame.width / self.barView.frame.width
        let scroll = self.scrollViewOutlet.contentOffset.x
        
        self.barView.transform = CGAffineTransform(translationX: scroll/multi , y: 0)
    }
    
}
 
