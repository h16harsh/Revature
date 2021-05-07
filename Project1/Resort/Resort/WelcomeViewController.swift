//
//  WelcomeViewController.swift
//  Resort
//
//  Created by admin on 4/21/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeUser: UILabel!
    
    @IBOutlet weak var coupon: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coupon.text = ThankYouViewController.GlobalVariable.coupon
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
