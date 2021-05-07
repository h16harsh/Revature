//
//  ViewController.swift
//  Resort
//
//  Created by admin on 4/19/21.
//

import UIKit

class ViewController: UIViewController {
   // var pos = 0
    
    @IBOutlet weak var lb: UILabel!
    
    @IBOutlet weak var lamp: UIImageView!
    
    @IBOutlet weak var lampstay: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lamp.layer.cornerRadius = lamp.frame.width/2
        lamp.layer.masksToBounds = true
        
        lampstay.layer.cornerRadius = lamp.frame.width/2
        lampstay.layer.masksToBounds = true
        
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ani), userInfo: nil, repeats: true)
        
        perform(#selector(col), with: nil, afterDelay: 4.0)
    
    }
    @objc func col(){
        lb.textColor = .blue
    }
    
    @objc func ani(){
        let animat = UIViewPropertyAnimator(duration: 2.0, curve: .linear){
            
                //var ll = self.lamp.center.x
            self.lamp.center.x = 313
            self.lamp.center.y = 630
            self.lamp.frame.size.height = 200
            self.lamp.frame.size.width = 200
                
        }
        animat.startAnimation()
        
       
        
    }
        /*
        switch(pos){
        case 0:
            let ani = UIViewPropertyAnimator(duration: 2.0, curve: .linear){
            var ll = self.lamp.center.x
                self.lamp.center.x = 300
                }
            ani.startAnimation()
            pos = 1
    case 1:
        UIView.animate(withDuration: 4.0, delay: 2, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [], animations: {
        var lly = self.lamp.center.y
        self.lamp.center.y = self.view.bounds.height - 100
        }, completion:nil)
        pos = 2
        
    case 1:
        UIView.animate(withDuration: 4.0, delay: 2, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [], animations: {
        var ll = self.lamp.center.x
        self.lamp.center.x = 300
        }, completion:nil)
        pos = 3
 
   
    case 2:
        UIView.animate(withDuration: 4.0, delay: 2, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [], animations: {
        var lly = self.lamp.center.y
        self.lamp.center.y = self.view.bounds.height - 700
        }, completion:nil)
        pos = 0
 
    default:
        print("")
    }
 */
    }



