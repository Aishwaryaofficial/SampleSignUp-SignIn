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
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!

    // MARK: PROPERTY
    
    var signInScene = SignInVC()
    var signUpScene = SignUpVC()
    
    
    // MARK: LIFE CYCLE
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollViewOutlet.frame = CGRect( x: 0 , y: 243 , width : self.view.frame.width , height: 325)
        
        signInScene = self.storyboard?.instantiateViewController(withIdentifier: "SignInSID") as! SignInVC
        signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSID") as! SignUpVC
        
        self.addChildViewController(signInScene)
        self.addChildViewController(signUpScene)

        signInScene.didMove(toParentViewController: self)
        signUpScene.didMove(toParentViewController: self)

        self.scrollViewOutlet.addSubview((signInScene.view)!)
        self.scrollViewOutlet.addSubview((signUpScene.view)!)
        
        
        // SETTING UP THE DELEGATE OF SCROLL VIEW
        
        scrollViewOutlet.delegate = self
        
        // NOTIFICATION CENTER
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
                else{ return }
            
            let keyboardHeight = userinfo.cgRectValue.height
            self.scrollViewBottomConstraint.constant = keyboardHeight - 130
            
        })
        
        //Adding Oveserver To Notification Centre for notifying KeyboardWillHide
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
        self.scrollViewBottomConstraint.constant = 0
            
        })
        
        signInScene.signUpOutlet.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
         signUpScene.signInOutlet.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
    }
    override func viewWillLayoutSubviews() {
        self.scrollViewOutlet.frame = CGRect( x: 0 , y: 243 , width : self.view.frame.width , height: 325)
        
        signInScene.view.frame = CGRect(x: 0 , y: 0 , width : self.scrollViewOutlet.frame.width, height: 325)
        signUpScene.view.frame = CGRect(x: self.scrollViewOutlet.frame.width , y: 0 , width : self.scrollViewOutlet.frame.width, height: 325)
        
        self.scrollViewOutlet.contentSize = CGSize(width: (self.scrollViewOutlet.frame.width) * 2, height: self.scrollViewOutlet.frame.height)

    }
    
    // MARK: @IBAction
    
    @IBAction func signInAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
           self.scrollViewOutlet.contentOffset.x = 0

        }, completion: nil)
       
    }
    
    
    

    @IBAction func signUpAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.scrollViewOutlet.contentOffset.x = self.scrollViewOutlet.frame.width
            
        }, completion: nil)
    }
    

    
}

// MARK: extension MainVC : UIScrollViewDelegate

extension MainVC : UIScrollViewDelegate{
    
    // METHOD OF SCROLL VIEW       
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let multi = self.scrollViewOutlet.frame.width / self.barView.frame.width
        let scroll = self.scrollViewOutlet.contentOffset.x
        
        self.barView.transform = CGAffineTransform(translationX: scroll/multi , y: 0)
    }
    
}
 
                                                                                          
