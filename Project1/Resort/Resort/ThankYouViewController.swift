//
//  ThankYouViewController.swift
//  Resort
//
//  Created by admin on 4/22/21.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var code: UILabel!
    
    struct GlobalVariable{
        static var coupon:String = "Your Coupons Will Appear Here"
    }
    
    
    @IBAction func addCode(_ sender: Any) {
        var c = code.text!
        ThankYouViewController.GlobalVariable.coupon = c
        let dic = ["user":  Screen1ViewController.GlobalVariable.us, "coupon": ThankYouViewController.GlobalVariable.coupon]
        DBHelper.inst.addCoupon(object: dic as! [String:String])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
