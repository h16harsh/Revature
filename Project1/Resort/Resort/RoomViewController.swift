//
//  RoomViewController.swift
//  Resort
//
//  Created by admin on 4/22/21.
//

import UIKit
class RoomViewController: UIViewController {
    var rate1:String?
    var rate2:String?
    var rate3:String?
    var rate4:String?
    var rate5:String?
    
    var val1 = 0.0
    var val2 = 0.0
    var val3 = 0.0
    var val4 = 0.0
    var val5 = 0.0
    
    @IBOutlet weak var star1: CosmosView!
    @IBOutlet weak var star2: CosmosView!
    @IBOutlet weak var star3: CosmosView!
    @IBOutlet weak var star4: CosmosView!
    @IBOutlet weak var star5: CosmosView!
    
    @IBAction func save2(_ sender: Any) {
        if(rate1!.isEmpty == false && rate2!.isEmpty == false && rate3!.isEmpty == false && rate4!.isEmpty == false && rate5!.isEmpty == false){
            val1 = Double(rate1!)!
            val2 = Double(rate2!)!
            val3 = Double(rate3!)!
            val4 = Double(rate4!)!
            val5 = Double(rate5!)!
        }
        let dic = [val1, val2, val3, val4, val5]
        DBHelper.inst.addRoomFeedback(object: dic)
        
    }
    
    @IBAction func save(_ sender: Any){
        if(rate1!.isEmpty == false && rate2!.isEmpty == false && rate3!.isEmpty == false && rate4!.isEmpty == false && rate5!.isEmpty == false){
            val1 = Double(rate1!)!
            val2 = Double(rate2!)!
            val3 = Double(rate3!)!
            val4 = Double(rate4!)!
            val5 = Double(rate5!)!
        }
        let dic = [val1, val2, val3, val4, val5]
        DBHelper.inst.addRoomFeedback(object: dic)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rate1 = ""
        rate2 = ""
        rate3 = ""
        rate4 = ""
        rate5 = ""
        
        star1.didFinishTouchingCosmos = {
            s in
                self.rate1 = String(s)
        }
        star2.didFinishTouchingCosmos = {
            s in
                self.rate2 = String(s)
        }
        star3.didFinishTouchingCosmos = {
            s in
                self.rate3 = String(s)
        }
        star4.didFinishTouchingCosmos = {
            s in
                self.rate4 = String(s)
        }
        star5.didFinishTouchingCosmos = {
            s in
                self.rate5 = String(s)
        }
        
     }
    // Do any additional setup after loading the view.

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

