//
//  ViewController.swift
//  SpeedLimit
//
//  Created by Landon Haugh on 5/13/19.
//  Copyright © 2019 Haugh. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        OperationQueue.main.addOperation {
            controller.dismiss(animated: true, completion: {});
        }
        print("I want to dismiss here")
        
    }
    
    @IBOutlet weak var currentSpeed: UILabel!
    
    @IBAction func sendSixty(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 60";
        displayMessageInterface(speed: 60)
    }
    @IBAction func sendSixtyFive(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 65";
        displayMessageInterface(speed: 65)
    }
    @IBAction func sendSeventy(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 70";
        displayMessageInterface(speed: 70)
    }
    @IBAction func sendSeventyFive(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 75";
        displayMessageInterface(speed: 75)
    }
    @IBAction func sendEighty(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 80";
        displayMessageInterface(speed: 80)
    }
    @IBAction func sendEightyFive(_ sender: UIButton) {
        self.currentSpeed.text = "Current Speed: 85";
        displayMessageInterface(speed: 85)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentSpeed.text = "Current Speed: Not Set";
    }

    func displayMessageInterface(speed: Int) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["+12283448382"]
        composeVC.body = "SpeedLimit set: \(speed)"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }

}

