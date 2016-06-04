//
//  MainViewController.swift
//  PeopleCounter
//
//  Created by ahthwa on 2016. 6. 4..
//  Copyright © 2016년 ahthwa. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {

    @IBOutlet var SessionNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Ready View did load")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Ready View will Appear")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let timestr = dateFormatter.stringFromDate(NSDate())
        print(timestr)
        SessionNameText.text = timestr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func StartCount(sender: AnyObject) {
        self.performSegueWithIdentifier("startCounting", sender: SessionNameText.text)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")
        if (segue.identifier == "startCounting") {
            let counterVC = segue.destinationViewController as! CounterViewController
            let fileName = sender as! String
            counterVC.logFileName = fileName
        }
    }
}
