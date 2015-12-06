//
//  ViewController.swift
//  Multiples
//
//  Created by Dan Smith on 06/12/2015.
//  Copyright © 2015 Dan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //properties
    var multiple: Int = 0
    var total = 0
    var previousTotal = 0
    var newTotal = 0
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var multipleTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var addLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getMultiple(){
        if multipleTxt.text != nil && multipleTxt.text != ""{
            multiple = (Int(multipleTxt.text!)!)
            showPage2()
        }
    }
    func showPage2()
    {
        logoImg.hidden = true
        multipleTxt.hidden = true
        playBtn.hidden = true
        addBtn.hidden = false
        addLbl.hidden = false

        
    }
    func showPage1()
    {
        logoImg.hidden = false
        multipleTxt.hidden = false
        playBtn.hidden = false
        addLbl.hidden = true
        addBtn.hidden = true
    }
    @IBAction func hideKeyboard(sender: AnyObject) {
        resignFirstResponder()
    }
    func updateAddLbl(){
        addLbl.text = "\(previousTotal) + \(multiple) = \(total)"
        
    }
    @IBAction func playBtnPressed(sender: AnyObject) {
        getMultiple()
    }
    @IBAction func addBtnPressed(sender: AnyObject) {
       
        doMaths()
        updateAddLbl()
        if total >= multiple * 10{
            restartGame()
        }
   }
    func doMaths(){
        
       total = total + multiple
    previousTotal = total - multiple
        
    }
    
    func restartGame(){
        showPage1()
        total = 0
        previousTotal = 0
        multiple = 0
        addLbl.text = "Press add"
    }
}

