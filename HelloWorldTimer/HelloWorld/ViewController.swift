//
//  ViewController.swift
//  HelloWorld
//
//  Created by Issavara Polanun on 12/11/16.
//  Copyright © 2016 Issavara Polanun. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var countdownLabel: NSTextField!
    
    
    //click button to start/stop timer
    @IBAction func timerButton(sender: AnyObject) {
        let previousTimerState = timerButtonText.stringValue
        print("Previous state = " + previousTimerState)

        if (timerButtonText.stringValue == "GO!") || (timerButtonText.stringValue == "Break"){ //pause timer
            stopTimer()

        } else { //start timer again
            
            
            if previousTimerState == "GO!" {
                print("GO CASE")
                timerButtonText.stringValue = "GO!"
                startTimer()

            } else if previousTimerState == "Break" {
                print("BREAK CASE")
                timerButtonText.stringValue = "Break"
                startTimer()

            } else {
                print("OTHER CASE")
                timerButtonText.stringValue = "GO!"
                startTimer()

            }

        }
    }
    
    @IBOutlet var timerButtonText: NSTextField!
    
    
    @IBOutlet var magicButton: NSButton! //for changing button properties
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.view.wantsLayer = true
        countdownLabel.stringValue = "0"
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColorRef = CGColorCreateGenericRGB(255.0, 255.0, 255.0, 1.0)
            self.view.layer?.backgroundColor = color
        }
        
    }
    
    var SwiftTimer = NSTimer()
    var SwiftCounter = 10 //can change this later
    var timerType = "Work"
    
    func updateCounter() {
        SwiftCounter = Int(countdownLabel.stringValue)!
//        top two if else statement cases will keep the timer going
        if (SwiftCounter == 0) && (timerType == "Work"){
            timerType = "Rest"
            SwiftCounter = 5
            countdownLabel.stringValue = String(SwiftCounter)
            timerButtonText.stringValue = "Break"
            
//            countdownLabel.backgroundColor = NSColor.whiteColor()
//            timerButtonText.backgroundColor = NSColor.whiteColor()
            
        }
            
        else if (SwiftCounter == 0) && (timerType == "Rest"){
            timerType = "Work"
            SwiftCounter = 10
            countdownLabel.stringValue = String(SwiftCounter)
            timerButtonText.stringValue = "GO!"
            
//            countdownLabel.backgroundColor = NSColor.greenColor()
//            timerButtonText.backgroundColor = NSColor.greenColor()
        }
            
        else {
            SwiftCounter -= 1
            countdownLabel.stringValue = String(SwiftCounter)
        }
        
    }
    
    func startTimer() {
        SwiftTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
        //change color to green
//        countdownLabel.backgroundColor = NSColor.greenColor()
//        timerButtonText.backgroundColor = NSColor.greenColor()
    }
    
    func stopTimer() {
        //stop timer
        SwiftTimer.invalidate()
        
        timerButtonText.stringValue = "Paused"
        //change color to red
//        countdownLabel.backgroundColor = NSColor.redColor()
//        timerButtonText.backgroundColor = NSColor.redColor()
    }


}

