//
//  ForgetPasswordViewController.swift
//  BigWheelCasino
//
//  Created by Apple on 20/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var btnRightArrow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        btnRightArrow.roundCorners(corners: [.topRight, .bottomRight], radius: 25.0)
    }
    
    /*
    // MARK: - Navigation
    */
    
    //MARK:- Button Action
    @IBAction func actionVerifyId(_ sender: Any){
           
    }
    
    @IBAction func actionBackToLogin(_ sender: Any){
        self.navigationController?.setViewControllers([TutorialViewController.instance(.main)], animated: true)
    }

}
