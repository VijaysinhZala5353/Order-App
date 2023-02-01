//
//  ViewController.swift
//  Order App
//
//  Created by user213523 on 3/8/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemList[row].itemName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        itemImage.image = UIImage(named: itemList[row].itemImage)
        price.text = String(itemList[row].itemPrice)
        quantity.text="0"
        total = Double(String(price.text!))!*Double(String(quantity.text!))!
        itemTotal.text=String(total)
    }
    
    var itemList = [Item]()
    var total = 0.0
    var finalTotal = 0.0
    var totalAmount = 0.0

    @IBOutlet weak var orderAmount: UITextField!
    @IBOutlet weak var qtyMessage: UILabel!
    @IBOutlet weak var grandTotal: UITextField!
    @IBOutlet weak var delivery: UIButton!
    @IBOutlet weak var pickup: UIButton!
    @IBOutlet weak var itemTotal: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
        itemView.delegate=self
        itemView.dataSource=self
        itemImage.image = UIImage(named: itemList[0].itemImage)
        price.text = String(itemList[0].itemPrice)
        
        
    }
    
    func fillData()
    {
        itemList.append(Item(itemName: "bread", itemPrice: 4.99, itemQty: 15, itemImage: "bread"))
        itemList.append(Item(itemName: "butter", itemPrice: 2.99, itemQty: 5, itemImage: "butter"))
        itemList.append(Item(itemName: "eggs", itemPrice: 6.99, itemQty: 10, itemImage: "eggs"))
        itemList.append(Item(itemName: "milk", itemPrice: 5.99, itemQty: 13, itemImage: "milk"))
        itemList.append(Item(itemName: "orange juice", itemPrice: 3.99, itemQty: 8, itemImage: "orange juice"))
        itemList.append(Item(itemName: "salt", itemPrice: 1.99, itemQty: 4, itemImage: "salt"))
        itemList.append(Item(itemName: "sugar", itemPrice: 2.59, itemQty: 7, itemImage: "sugar"))
    }

    @IBAction func qtyChange(_ sender: UIStepper) {
        
        quantity.text=String(Int(sender.value))
        total = Double(String(price.text!))!*Double(String(quantity.text!))!
        itemTotal.text=String(format: "%.2f",total)
        
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        
        finalTotal += Double(String(itemTotal.text!))!
        grandTotal.text=String(finalTotal)
    }
    @IBAction func placeOrder(_ sender: UIButton) {
        pickup.isSelected=true
        totalAmount = Double(String(grandTotal.text!))!*1.13
        orderAmount.text = String(format: "%.2f", totalAmount)
    }
    @IBAction func deliveryMode(_ sender: UIButton) {
        sender.isSelected=true
        if sender==delivery{
            pickup.isSelected=false
            if Double(orderAmount.text!)!<100
            {
                orderAmount.text = String(format: "%.2f", totalAmount+30.0)
            }
        }else if sender==pickup{
            delivery.isSelected=false
            if Double(orderAmount.text!)!<100
            {
                orderAmount.text = String(format: "%.2f", totalAmount)
            }

    }
}

}
