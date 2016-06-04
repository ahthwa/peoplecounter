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

    @IBOutlet weak var LeftCounterButton: UIButton!
    @IBOutlet weak var RightCounterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LeftCounterButton.backgroundColor = UIColor.blueColor()
        RightCounterButton.backgroundColor = UIColor.greenColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LeftCounterClick(sender: AnyObject) {
        leftCounter += 1
        LeftCounterButton.setTitle(String(leftCounter), forState:UIControlState.Normal)
    }
    @IBAction func RightCounterClick(sender: AnyObject) {
        rightCounter += 1
        RightCounterButton.setTitle(String(rightCounter), forState:UIControlState.Normal)
    }
}

