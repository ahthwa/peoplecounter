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
    var logFileName:String = "test.txt"
    var logFilePath:String = ""
    var logFileHandle:NSFileHandle?

    @IBOutlet weak var LeftCounterButton: UIButton!
    @IBOutlet weak var RightCounterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Counter: View Did Load Called")
        LeftCounterButton.backgroundColor = UIColor.blueColor()
        RightCounterButton.backgroundColor = UIColor.greenColor()
        
        logFilePath = NSHomeDirectory() + "/Documents/" + logFileName
        
        if !NSFileManager.defaultManager().fileExistsAtPath(logFilePath) {
            NSFileManager.defaultManager().createFileAtPath(logFilePath, contents: nil, attributes: nil)
        }
        
        logFileHandle = NSFileHandle(forWritingAtPath: logFilePath)
        print(logFilePath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("did Receive Memory Warning")
        logFileHandle?.closeFile()
    }

    @IBAction func LeftCounterClick(sender: AnyObject) {
        leftCounter += 1
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss\t1\t0\n"
        let timestr = dateFormatter.stringFromDate(NSDate())
        
        LeftCounterButton.setTitle(String(leftCounter), forState:UIControlState.Normal)
        logFileHandle!.seekToEndOfFile()
        logFileHandle!.writeData(timestr.dataUsingEncoding(NSUTF8StringEncoding)!)
    }
    @IBAction func RightCounterClick(sender: AnyObject) {
        rightCounter += 1
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss\t0\t1\n"
        let timestr = dateFormatter.stringFromDate(NSDate())

        RightCounterButton.setTitle(String(rightCounter), forState:UIControlState.Normal)
        logFileHandle!.seekToEndOfFile()
        logFileHandle!.writeData(timestr.dataUsingEncoding(NSUTF8StringEncoding)!)
    }

    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            print("go back")
            logFileHandle?.closeFile()
        }
    }
}

