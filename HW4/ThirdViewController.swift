//
//  ThirdViewController.swift
//  HW4
//
//  Created by Yang Aolin on 2/25/17.
//  Copyright © 2017 Aolin Yang. All rights reserved.
//
var dictLable: [Int:String] = [ 0:"ABC" , 1:"NBC" , 2:"CBS" , 3:"Fox"]
var dictNumber: [Int:Int] = [ 0:2 , 1:3 , 2:4 , 3:5]

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var position = 0
    var FavLabel = ""
    var channel = 0
    @IBOutlet var theStepper: UIStepper!
    @IBOutlet var theChannelLabel: UILabel!
    @IBOutlet var theLabel: UITextField!
    @IBOutlet var theSeg: UISegmentedControl!
    @IBAction func changeSeg(_ sender: UISegmentedControl) {
        position = theSeg.selectedSegmentIndex
    }
    @IBAction func getLebelName(_ sender: Any) {
        FavLabel = theLabel.text!
    }
    @IBAction func ChannelStepper(_ sender: UIStepper) {
        channel = Int(sender.value)
        theChannelLabel.text = "Channel    " + "\(channel)"
    }
    @IBAction func actionCancel(_ sender: Any) {
        position = 0
        FavLabel = ""
        channel = 1
        theStepper.value = 1
        theChannelLabel.text = "Channel    " + "\(channel)"
        theLabel.text = ""
        theSeg.selectedSegmentIndex = 0
    }
    
    func showAlertMessage(_ title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonAct(_ sender: Any) {
        if let label = theLabel.text, !label.isEmpty {
            if label.characters.count < 1 || label.characters.count > 4 {
                showAlertMessage("Warning", message: "The label must be between 1-4 letters in length", handler: { action in
                    self.theLabel.becomeFirstResponder()
                });
                return
            }
            dictLable[position] = theLabel.text
            dictNumber[position] = Int(channel)
            theLabel.text = ""
            channel = 1
            theStepper.value = 1
            theSeg.selectedSegmentIndex = 0
            position = 0
            theChannelLabel.text = "Channel    " + "\(channel)"
            
            
            showAlertMessage("Congratulation", message: "You chanel has been added to your favorites!", handler: { action in
                self.theLabel.resignFirstResponder()
            });
            
        } else {
            showAlertMessage("Warning", message: "The label is empty, please try again!", handler: { action in
                self.theLabel.becomeFirstResponder()
            });
        }
        
    }


}
