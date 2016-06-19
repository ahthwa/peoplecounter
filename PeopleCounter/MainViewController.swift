//
//  MainViewController.swift
//  PeopleCounter
//
//  Created by ahthwa on 2016. 6. 18..
//  Copyright © 2016년 ahthwa. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    @IBOutlet var SessionNameText: UITextField!
    
    var testData:[String] = []
    
    func reloadData() {
        testData = []
        let logFilePath = NSHomeDirectory() + "/Documents/"
        let docUrl = NSURL.fileURLWithPath(logFilePath)
        
        do {
            let directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(docUrl, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
            for url in directoryContents.sort({$0.lastPathComponent > $1.lastPathComponent}) {
                testData.append(url.lastPathComponent!)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        print("reloadData")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Main View will Appear")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let timestr = dateFormatter.stringFromDate(NSDate())
        print(timestr)
        SessionNameText.text = timestr
        reloadData()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PCResultCell", forIndexPath: indexPath)
        var cellString = testData[indexPath.row]

        let logFilePath = NSHomeDirectory() + "/Documents/" + testData[indexPath.row]
        let filePathUrl = NSURL.fileURLWithPath(logFilePath)
        do {
            let contents = try String(contentsOfURL: filePathUrl, encoding: NSUTF8StringEncoding)
            let myStrings = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            cellString = "\(myStrings[myStrings.count - 1])"
        } catch {
            print("fail to load contents")
        }
        cell.textLabel?.text = cellString
        
        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let logFilePath = NSHomeDirectory() + "/Documents/" + testData[indexPath.row]
            do {
                try NSFileManager.defaultManager().removeItemAtPath(logFilePath)
                reloadData()
            }
            catch {
                print("Delete failed")
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
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
    