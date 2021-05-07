//
//  SignUpViewController.swift
//  Resort
//
//  Created by admin on 4/20/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var urn: UITextField!
    
    @IBOutlet weak var p1: UITextField!
    
    @IBOutlet weak var pc: UITextField!
    
    //var d:[String:String] = [:]
    
    var dd = Screen1ViewController.self
    
    //var dic = [String:String]()
    
    @IBAction func done(_ sender: Any) {
        var u : String = urn.text!
        var p : String = p1.text!
        var pp : String = pc.text!
        if(u.isEmpty == false && p.isEmpty == false && pp.isEmpty == false){
            
            if(p == pp){
                //  print(d.count)
                //print(urn.text!, pc.text!)
                dd.GlobalVariable.userDict[urn.text!] = pc.text!
                
                let dic = ["username": urn.text!, "password": pc.text!]
                DBHelper.inst.addData(object: dic as! [String:String])
                
                let redir = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "Screen1ViewController")
                present(redir, animated:true, completion: nil)
            }
            else{
                print("passwords not matching")
            }
            
        }
        else{
            print("Not all fields are filled")
            
        }
        
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
