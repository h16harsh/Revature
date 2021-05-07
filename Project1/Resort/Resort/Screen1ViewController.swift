//
//  Screen1ViewController.swift
//  Resort
//
//  Created by admin on 4/20/21.
//

import UIKit

class Screen1ViewController: UIViewController {
    let ud = UserDefaults.standard
    static var state = false
    
    @IBOutlet weak var msg: UILabel!
    
    struct GlobalVariable{
        static var userDict:[String:String] = ["admin":"admin"]
        static var us:String = ""
        static var p:String = ""
    }
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var diff: UISwitch!
    
    @IBAction func login(_ sender: Any) {
        let data2 = DBHelper.inst.getCoupon()
        let data = DBHelper.inst.getData()
        for st in data{
            Screen1ViewController.GlobalVariable.userDict[st.username!] = st.password
        }
        //Screen1ViewController.global.userDict = ["admin":"admin"]
        
        for (i,v) in Screen1ViewController.GlobalVariable.userDict{
          //  print(i, v)
        // print(Screen1ViewController.GlobalVariable.userDict.count)
            if(userName.text! == i && pass.text! == v){
                Screen1ViewController.GlobalVariable.us = userName.text!
                Screen1ViewController.GlobalVariable.p = pass.text!
                for c in data2{
                    if(c.user! == Screen1ViewController.GlobalVariable.us ){
                        if(c.coupon != nil){
                            ThankYouViewController.GlobalVariable.coupon = c.coupon!
                        }
                        
                    }
                }
                
                let redir = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "WelcomeViewController")
                present(redir, animated:true, completion: nil)
            }
            else{
                msg.text = "Wrong User ID or Password"
                msg.backgroundColor = .black
                //print("Wrong USer Id or Password")
            }
        }
        
       
    }
    
    
    @IBAction func save(_ sender: Any) {
        if(diff.isOn == true){
            if(userName.text != nil && pass.text != nil){
                ud.set(userName.text!, forKey: "id")
                ud.set(pass.text!, forKey: "p")
                print("Data Saved", userName.text!, pass.text!)
            }
            else{
                userName.text = ud.string(forKey:"id")
                pass.text = ud.string(forKey: "p")
                print("Data Displayed")
            }
        }
        else{
            ud.removeObject(forKey: "id")
            ud.removeObject(forKey: "p")
            userName.text = nil
            pass.text = nil
            print("Data Removed")
        }
        
        if(diff.isOn){
            Screen1ViewController.state = true
        }
        else{
            Screen1ViewController.state =  false
        }
        ud.set(Screen1ViewController.state, forKey: "state")

        
    }
    
    func setIDP(){
        userName.text = ud.string(forKey:"id")
        pass.text = ud.string(forKey: "p")
        print("Data Displayed",userName.text!, pass.text!)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Screen1ViewController.state = ud.bool(forKey: "state")
        diff.setOn(Screen1ViewController.state, animated: true)
        if(diff.isOn == true){
            setIDP()
            
            
        }
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
