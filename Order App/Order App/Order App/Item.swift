//
//  Item.swift
//  Order App
//
//  Created by user213523 on 3/8/22.
//

import Foundation

class Item
{
    var itemName : String
    var itemPrice : Double
    var itemQty : Int
    var itemImage : String
    
    init(itemName:String, itemPrice:Double, itemQty:Int, itemImage:String)
    {
        self.itemName=itemName
        self.itemPrice=itemPrice
        self.itemQty=itemQty
        self.itemImage=itemImage
    }
}
