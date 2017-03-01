//
//  DVRcontrollerViewController.swift
//  HW4
//
//  Created by Yang Aolin on 2/16/17.
//  Copyright © 2017 Aolin Yang. All rights reserved.
//

import UIKit

class DVRcontrollerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func switch_to_TV(_ sender: UIBarButtonItem) {
        dismiss(animated:true, completion:nil)
    }
    
    @IBOutlet var BRecord: UIButton!
    @IBOutlet var BFastRewind: UIButton!
    @IBOutlet var BFastForwad: UIButton!
    @IBOutlet var Bpause: UIButton!
    @IBOutlet var Bstop: UIButton!
    @IBOutlet var BPlay: UIButton!
    @IBOutlet var Switch: UISwitch!
    @IBOutlet var power_statue: UILabel!
    @IBOutlet var action_statue: UILabel!
    @IBAction func DVRsiwtch(_ sender: UISwitch) {
        if Switch.isOn{
            power_statue.text = "Power Statue:                      On"
            BRecord.isEnabled = true
            BFastForwad.isEnabled = true
            BFastRewind.isEnabled = true
            Bpause.isEnabled = true
            Bstop.isEnabled = true
            BPlay.isEnabled = true
            
        }else {//restore everything
            power_statue.text = "Power Statue:                      Off"
            action_statue.text = "Action Statue:                      Stop"
            BRecord.isEnabled = false
            BFastForwad.isEnabled = false
            BFastRewind.isEnabled = false
            Bpause.isEnabled = false
            Bstop.isEnabled = false
            BPlay.isEnabled = false
            isplaying = false
            isstoped = false
            isrecording = false
            
        }
    }
    
    var isplaying = false
    var isstoped = false
    var isrecording = false
    @IBAction func mutil_action(_ sender: UIButton) {
        if Switch.isOn{
            if sender.currentTitle == "Fast Forwad"{
                isstoped = false
                if isplaying{
                    action_statue.text = "Action Statue:                  Fast Forwad"
                    isplaying = false
                    isrecording = false
                }
                else
                {
                    InvalidRequest("Fast Forwading")
                }
            }
            else if sender.currentTitle == "Pause"{
                isstoped = false
                if isplaying{
                    action_statue.text = "Action Statue:                      Pause"
                    isplaying = false
                    isrecording = false
                }
                else
                {
                    InvalidRequest("Pause")
                }
            }
            else if sender.currentTitle == "Fast Rewind"{
                isstoped = false
                if isplaying{
                    action_statue.text = "Action Statue:                  Fast Rewind"
                    isplaying = false
                    isrecording = false
                }
                else
                {
                    InvalidRequest("Fast Rewinding")
                }

            }
            else if sender.currentTitle == "Record"{
                if isstoped{
                    action_statue.text = "Action Statue:                      Record"
                    isstoped = false
                    isrecording = true
                    isplaying = false
                }else
                {
                    InvalidRequest("Recording")
                }
            }
            else if sender.currentTitle == "Play"{
                if isrecording {
                    InvalidRequest("Playing")
                }
                else
                {
                isstoped = false
                isplaying = true
                isrecording = false
                action_statue.text = "Action Statue:                      Play"
                }
            }
            else if sender.currentTitle == "Stop"{
                isstoped = true
                isplaying = false
                isrecording = false
                action_statue.text = "Action Statue:                      Stop"
            }
            
        }
    }
    
    internal func InvalidRequest(_ stateRequested: String){
        let title = "You' ve selected an invalid request."
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) {
            action in let cancelController = UIAlertController(title: "Request cancelled.", message: "", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            cancelController.addAction(okayAction)
            self.present(cancelController, animated: true, completion: nil)
        }
        let confirmAction = UIAlertAction(title: "Force", style: .default) {
            action in let okayController = UIAlertController(title: "Current operation stopped", message: "Request operation processing.", preferredStyle: .alert)
            self.action_statue.text = "Stopped"
            if(stateRequested == "Play" || stateRequested == "Pause" || stateRequested == "Fast Forward" || stateRequested == "Fast Rewind"){
                self.isplaying = true
            } else {
                self.isplaying = false
            }
            self.action_statue.text = stateRequested
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            okayController.addAction(okayAction)
            self.present(okayController, animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    


}
