//
//  DetailViewController.swift
//  Products App Demo
//
//  Created by Victor  Adu on 9/4/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    var product : Product!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var regPriceTextField: UITextField!
    
    @IBOutlet weak var salesPriceTextField: UITextField!
    
    let textFieldPadding = 100

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.nameTextField.text = product.prodt_name
        self.descriptionTextField.text = product.prodt_description
        
        //self.regPriceTextField.text = product.reg_price  //String is not convertible to Int...?
        // self.salesPriceTextField.text = product.sales_price
        //self.idTextField.text = product.prodt_id
        
        
        self.detailImageView.image = product.prodt_photo
        
        if product.prodt_photo == nil{
            detailImageView.image = UIImage(named: "Organic_Placeholder")
        }else {
            detailImageView.image = product.prodt_photo
        }
    }
    
    //Set cornerRadius and border Color of our Image
    override func viewWillAppear(animated: Bool) {
        //You can insert'self.' infront of 'detailImageView' if you want.
        detailImageView!.layer.cornerRadius = detailImageView.frame.width * 0.25
        detailImageView!.layer.borderColor = UIColor.greenColor().CGColor
        detailImageView!.layer.borderWidth = 7
        detailImageView!.layer.masksToBounds = true //Dont forget to end with the maskToBounds method. Very important
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SaveBtnPressed(sender: AnyObject) {
        
    }
    
    
    //MARK: -IOS TEXTFIELD TOUCH FUNCTIONS
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        /*   for control in self.view.subviews {
        if let theControl = control as? UITextField {
        theControl.resignFirstResponder()
        }
        }   */ //Above is same as below
        
        self.view.endEditing(true) //Forces Keyboard to disappear when user clicks outside the Textfield
    }
    
    //implementing UITEXTFIELDDELEGATE METHODS--
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    
    
    //Setting bounds for our textfield when user begins editing. Basically, we are moving our textfield IBOutlets out of the way to not be covered by our keyboard.
    func textFieldDidBeginEditing(textField: UITextField!) {
        println("began editing")
        
        let curWidth = self.view.bounds.width
        let curHeight = self.view.bounds.height
        let newY = textField.frame.origin.y - CGFloat(self.textFieldPadding)
        let currentX = self.view.bounds.origin.x
        
        UIView.animateWithDuration(0.3, animations:{ () -> Void
            in
            
            self.view.bounds = CGRect(x: currentX, y: newY, width: curWidth, height:curHeight)
            //self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, -120.0)
            
        })
    }
    
    
    
    //Revert our UITextfields to normal after we done editing
    func textFieldDidEndEditing(textField: UITextField!) {
        println("did end editing")
        
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
        UIView.animateWithDuration(0.3, animations:{ () -> Void
            in
            
            self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height:currentHeight)
            
        })
        
    }


}
