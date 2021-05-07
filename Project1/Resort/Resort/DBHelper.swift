//
//  DBHelper.swift
//  Resort
//
//  Created by admin on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    static var inst = DBHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context1 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context2 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context3 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context4 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context5 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    let context6 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func addRoomFeedback(object: [Double]){
        let room = NSEntityDescription.insertNewObject(forEntityName: "RoomFeedback", into:context2!) as! RoomFeedback
        room.star1 = object[0]
        room.star2 = object[1]
        room.star3 = object[2]
        room.star4 = object[3]
        room.star5 = object[4]
        
        do{
            try context2?.save()
            print("Room data saved")
        }
        catch{
            print("Room data not saved")
        }
        
    }
    
    func addFoodFeedback(object: [Double]){
        let food = NSEntityDescription.insertNewObject(forEntityName: "FoodFeedback", into:context3!) as! FoodFeedback
        food.star1 = object[0]
        food.star2 = object[1]
        food.star3 = object[2]
        food.star4 = object[3]
        food.star5 = object[4]
        
        do{
            try context3?.save()
            print("Food data saved")
        }
        catch{
            print("Food data not saved")
        }
        
    }
    func addGYMFeedback(object: [Double]){
        let gym = NSEntityDescription.insertNewObject(forEntityName: "GYMFeedback", into:context4!) as! GYMFeedback
        gym.star1 = object[0]
        gym.star2 = object[1]
        gym.star3 = object[2]
        gym.star4 = object[3]
        gym.star5 = object[4]
        
        do{
            try context4?.save()
            print("Room data saved")
        }
        catch{
            print("Room data not saved")
        }
        
    }
    func addSPAFeedback(object: [Double]){
        let spa = NSEntityDescription.insertNewObject(forEntityName: "SPAFeedback", into:context5!) as! SPAFeedback
        spa.star1 = object[0]
        spa.star2 = object[1]
        spa.star3 = object[2]
        spa.star4 = object[3]
        spa.star5 = object[4]
        
        do{
            try context5?.save()
            print("SPA data saved")
        }
        catch{
            print("SPA data not saved")
        }
        
    }
    func addOverallFeedback(object: [Double]){
        let over = NSEntityDescription.insertNewObject(forEntityName: "OverallFeedback", into:context6!) as! OverallFeedback
        over.star1 = object[0]
        over.star2 = object[1]
        over.star3 = object[2]
        over.star4 = object[3]
        over.star5 = object[4]
        
        do{
            try context6?.save()
            print("Overall data saved")
        }
        catch{
            print("Overall data not saved")
        }
        
    }
    
    func addData(object: [String:String]){
        let userdata = NSEntityDescription.insertNewObject(forEntityName: "UserData", into:context!) as! UserData
        userdata.username = object["username"]
        userdata.password = object["password"]
        
        do{
            try context?.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
        
    }
    
    func addCoupon(object: [String:String]){
        let coup = NSEntityDescription.insertNewObject(forEntityName: "Coupon", into:context1!) as! Coupon
        coup.user = object["user"]
        coup.coupon = object["coupon"]
            do{
            try context?.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
        
    }
    
    func getCoupon()->[Coupon]{
        var u = [Coupon]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Coupon")
        do{
            u = try context1?.fetch(fetchReq) as! [Coupon]
        }
        catch{
            print("can not fetch any data")
        }
        return u
    }
    
    func getData()->[UserData]{
        var u = [UserData]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        do{
            u = try context?.fetch(fetchReq) as! [UserData]
        }
        catch{
            print("can not fetch any data")
        }
        return u
    }
    
    
    func getOneData(name:String)->UserData{
       
        var u = UserData()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
        fetchReq.predicate = NSPredicate(format:"username == %@", name)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [UserData]
            if(req.count != 0){
                u = req.first as! UserData
            }
            else{
                print("data not found")
            }
        }
        catch{
            print("")
        }
        return u
    }
    
    func updateData(object:[String:String]){
        var u = UserData()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["username"]!)
        do{
            let stu = try context?.fetch(fetchReq)
            if(stu?.count != 0){
                u = stu?.first as! UserData
                u.password = object["password"]!
                try context?.save()
                print("data saved")
            }
        }
        catch{
            print("error")
        }
    }
    
    func deleteData(name : String){
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        
        do{
            let st = try context?.fetch(fetchReq)
            context?.delete(st?.first as! UserData)
            try context?.save()
            
        }
        catch{
            print("data not deleted")
        }
    }
}

