//
//  ViewController.swift
//  PeopleCounter
//
//  Created by ahthwa on 2016. 6. 4..
//  Copyright © 2016년 ahthwa. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    var leftCounter:Int = 0
    var rightCounter:Int = 0
    var logFileName:String = "test"
    var logFilePath:String = ""
    var logFileHandle:NSFileHandle?

    @IBOutlet weak var LeftCounterButton: UIButton!
    @IBOutlet weak var RightCounterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Counter: View Did Load Called")
        
        logFilePath = NSHomeDirectory() + "/Documents/" + logFileName + ".txt"
        
        if !NSFileManager.defaultManager().fileExistsAtPath(logFilePath) {
            NSFileManager.defaultManager().createFileAtPath(logFilePath, contents: nil, attributes: nil)
        }
        
        logFileHandle = NSFileHandle(forWritingAtPath: logFilePath)
        print(logFilePath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func touchLog(lc:Int, rc:Int) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss\t\(lc)\t\(rc)\n"
        let timestr = dateFormatter.stringFromDate(NSDate())
        LeftCounterButton.setTitle(String(leftCounter), forState:UIControlState.Normal)
        logFileHandle!.seekToEndOfFile()
        logFileHandle!.writeData(timestr.dataUsingEncoding(NSUTF8StringEncoding)!)
    }
    
    @IBAction func LeftDecrease(sender: AnyObject) {
        if (leftCounter > 0) {
            leftCounter -= 1
            LeftCounterButton.setTitle(String(leftCounter), forState:UIControlState.Normal)
            touchLog(-1, rc: 0)
        }
    }

    @IBAction func RightDecrease(sender: AnyObject) {
        if (rightCounter > 0) {
            rightCounter -= 1
            RightCounterButton.setTitle(String(rightCounter), forState:UIControlState.Normal)
            touchLog(0, rc: -1)
        }
    }
    
    @IBAction func LeftCounterClick(sender: AnyObject) {
        leftCounter += 1
        LeftCounterButton.setTitle(String(leftCounter), forState:UIControlState.Normal)
        touchLog(1, rc:0)
    }
    @IBAction func RightCounterClick(sender: AnyObject) {
        rightCounter += 1
        RightCounterButton.setTitle(String(rightCounter), forState:UIControlState.Normal)
        touchLog(0, rc:1)
    }

    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            logFileHandle!.writeData(("\(logFileName): \(leftCounter)/\(rightCounter)").dataUsingEncoding(NSUTF8StringEncoding)!)
            print("go back")
            logFileHandle?.closeFile()
        }
    }
}

