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
        
        /*
         let date = NSDate()
         let calendar = NSCalendar.currentCalendar()
         
         //let components = calendar.components(.CalendarUnitHour || .CalendarUnitMinute, fromDate: date)
         let components = calendar.components(.CalendarUnitHour, fromDate: date)
         
         let hour = components.hour
         //let minutes = components.minute
         print (hour)
         */
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
    }

}
