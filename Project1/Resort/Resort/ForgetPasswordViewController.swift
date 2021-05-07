//
//  ForgetPasswordViewController.swift
//  Resort
//
//  Created by admin on 4/20/21.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    var dd = Screen1ViewController.self

    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var pc: UITextField!
    
    @IBAction func tour(_ sender: Any) {
        var u = user.text!
        var p1 = p.text!
        var p2 = pc.text!
        var uu = ""
        var pp = ""
        if(u.isEmpty == false && p1.isEmpty == false && p2.isEmpty == false){
            if(p.text! == pc.text!){
                let data = DBHelper.inst.getData()
                for st in data{
                    Screen1ViewController.GlobalVariable.userDict[st.username!] = st.password
                }
                for (i,v) in dd.GlobalVariable.userDict{
                            if(i == user.text!){
                                display.text = "User Matched!"
                                dd.GlobalVariable.userDict.updateValue(pc.text!, forKey: i)
                                uu = i
                                pp = pc.text!
                                
                                //print(pc.text!, i)
                                   
                                
                                let redir = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "Screen1ViewController")
                                present(redir, animated:true, completion: nil)
                                }
                                else{
                                        display.text = "No Match"
                                }
                    }
                  
            }
            else{
                display.text = "Passwords Do Not Match"
            }
        }
        else{
            display.text = "Fields Not Filled"
        }
        if(uu.count > 0 && pp.count > 0){
            let dic = ["username": uu, "password": pp]
            DBHelper.inst.updateData(object: dic as! [String:String])
            
        }
       
        
    }
    
    @IBOutlet weak var p: UITextField!
    
    @IBOutlet weak var user: UITextField!
    
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
