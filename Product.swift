//
//  Product.swift
//  Products App Demo
//
//  Created by Victor  Adu on 9/2/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit
import Foundation
//import CoreData

/* class Product: NSManagedObject {

    @NSManaged var prodt_name: String
    @NSManaged var prodt_description: String
    @NSManaged var reg_price: NSNumber
    @NSManaged var sales_price: NSNumber
    @NSManaged var prodt_photo: String
    @NSManaged var prodt_id: NSNumber
 
//    init(ProductName prodt: String, ProductDescription desc: String, RegularPrice regP:NSNumber, SalesPrice salesP:NSNumber){
//     
//        super.init
//        self.prodt_name = prodt
//        self.prodt_description = desc
//        self.reg_price = regP
//        self.sales_price = salesP
//    }
//We dont need this because we already initialized it.

    class func productsFromJSONDATA(jsonProductsData : NSArray) -> [Product]{
        
        var answerProducts = [Product]()
        
        for jsonProduct : AnyObject in jsonProductsData {
            if let colors = jsonProduct.objectForKey("colors")as? NSArray {
                var color = jsonProduct[0] as? Int
        }

            if let stores = jsonProduct["product_name"] as? NSDictionary {
            self.prodt_name = stores["product_name"] as String!
            self.prodt_description = stores["product_description"] as String!
            self.reg_price = stores["regular_price"] as NSNumber!
            self.sales_price = stores["sales_price"] as NSNumber!
            self.prodt_photo = stores["product_photo"] as String!
            self.prodt_id = stores["product_id"] as NSNumber!
            
        }
        answerProducts.append(prdts)
    }
 return answerProducts
}


*/

class Product : NSObject {
    
    var prdt1 = [Product]()
    
    var prodt_name: String?
    var prodt_description: String?
    var reg_price: Int?
    var sales_price: Int?
    var prodt_photo : UIImage?
    var prodt_id: Int?
    
    //Creating a function to parse through our JSON Data for our products.
    class func createProductJSONPath(jsonProductData: NSArray)-> [Product] {
        
        var prodts = [Product]()
        
        //Now lets loop through our 'NSArray' parameter
        for jsonProduct in jsonProductData {
            
            var newProduct = Product()
            
            newProduct.prodt_name = jsonProduct["product_name"] as? String
            newProduct.prodt_description = jsonProduct["description"] as? String
            newProduct.prodt_photo = UIImage(named:jsonProduct["product_photo"]as String) //Converted UIImage to String using subscripting. We could also have used 'jsonProduct.objectForKey()' instead.
            
            newProduct.reg_price = jsonProduct["regular_price"] as? Int
            newProduct.sales_price = jsonProduct["sales_price"] as? Int
            newProduct.prodt_id = jsonProduct["product_id"] as? Int
            
            prodts.append(newProduct)
            
        }
        return prodts
    }
        
}

 