//
//  ViewController.swift
//  HW4
//
//  Created by Yang Aolin on 1/24/17.
//  Copyright © 2017 Aolin Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var power_statue: UILabel!
    @IBOutlet weak var Volume_statue: UILabel!
    @IBOutlet weak var channel_statue: UILabel!
    @IBOutlet weak var theSegment: UISegmentedControl!
    @IBOutlet weak var theSwitch: UISwitch!
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var bcm: UIButton!
    @IBOutlet weak var bcmm: UIButton!
    
    var count = 0
    var channel = 0
    var channel2 = 0
    var extra = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        for ( index,labels) in dictLable
        {
            theSegment.setTitle(labels, forSegmentAt: index)
            
        }
    }
    
    

    @IBAction func powerPressed(_ sender: UISwitch) {
        if theSwitch.isOn{
            power_statue.text = "Power Statue:                      On"
            theSlider.isEnabled = true
            theSegment.isEnabled = true
            b1.isEnabled = true
            b2.isEnabled = true
            b3.isEnabled = true
            b4.isEnabled = true
            b5.isEnabled = true
            b6.isEnabled = true
            b7.isEnabled = true
            b8.isEnabled = true
            b9.isEnabled = true
            b0.isEnabled = true
            bcmm.isEnabled = true
            bcm.isEnabled = true
            
        }else {//restore everything
            power_statue.text = "Power Statue:                      Off"
            Volume_statue.text = "Speak Volume:                      --"
            channel_statue.text = "Current Channel:                      --"
            count = 0
            channel = 0
            channel2 = 0
            theSlider.isEnabled = false
            theSegment.isEnabled = false
            b1.isEnabled = false
            b2.isEnabled = false
            b3.isEnabled = false
            b4.isEnabled = false
            b5.isEnabled = false
            b6.isEnabled = false
            b7.isEnabled = false
            b8.isEnabled = false
            b9.isEnabled = false
            b0.isEnabled = false
            bcmm.isEnabled = false
            bcm.isEnabled = false
        }
    }

    @IBAction func VolSlider(_ sender: UISlider) {
        if theSwitch.isOn{
            Volume_statue.text = "Speak Volume:                      \(sender.value)"
        }else{
            Volume_statue.text = "Speak Volume:                      --"
        }
    }
    
    @IBAction func channelpressed(_ sender: UIButton) {
        if theSwitch.isOn{//first of all, check if the power is on or not.
            if sender.currentTitle == "Ch+"{//make sure the channel not out of range
                if channel2 <= 98{
                    channel2 += 1
                    channel_statue.text = "Current Channel:                      \(channel2)"
                }else{
                    channel_statue.text = "Current Channel:                      Out of range"
                }
                
            }
            if sender.currentTitle == "Ch-"{//make sure the channel not out of range
                if channel2 >= 2
                {
                    channel2 -= 1
                    channel_statue.text = "Current Channel:                      \(channel2)"
                }else{
                    channel_statue.text = "Current Channel:                      Out of range"
                }
            }
            if sender.currentTitle != "Ch-" && sender.currentTitle != "Ch+"{
                count += 1
                channel = channel*10 + (Int(sender.currentTitle!) ?? 0)
                if count == 2 {
                    channel_statue.text = "Current Channel:                      \(channel)"
                    count = 0
                    channel2 = channel //reserve to CH+- use
                    channel = 0
                }
            }
        }else{
            channel_statue.text = "Current Channel:                      --"
            count = 0
            channel = 0
        }
    }
    
    
    @IBAction func favoritePressed(_ sender: UISegmentedControl) {
        if theSwitch.isOn{
            let number:Int = dictNumber[sender.selectedSegmentIndex]!
            channel_statue.text  = "Current Channel:                      \(number)"
            }
       
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

