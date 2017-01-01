//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

//var timer = NSTimer()

//class MyClass {
//    
//    func startTimer() {
//        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(MyClass.onTimer(_:)), userInfo: nil, repeats: true)
//    }
//    var i = 10
//    @objc func onTimer(timer:NSTimer!) {
//        if (i==0){
//            print("DONE")
//            
//        }
//        print(i)
//        i = i-1
//        
//    }
//}
//
//var anInstance = MyClass()
//
//anInstance.startTimer()
//
//CFRunLoopRun() // <-- HERE!

var count = 10


func update() {
    
    if(count > 0){
//        let minutes = String(count / 60)
//        let seconds = String(count % 60)
//        print(minutes + ":" + seconds)
//        count -= 1
        print(String(count -= 1))
    }
    else {
        print(0)
    }
    
}

//var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)


var timer = NSTimer.scheduledTimerWithTimeInterval(1,0, target: self, time, selector: Selector("update"), userInfo: nil, repeats: false)