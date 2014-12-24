//
//  SettingsViewController.swift
//  Taskit
//
//  Created by Joshua Kuehn on 12/23/14.
//  Copyright (c) 2014 Joshua Kuehn. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var capitalizeTableView: UITableView!
    
    @IBOutlet weak var completeNewTodoTableView: UITableView!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    let kVersionNumber = "1.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        First we have to add the delegate and datasource. You can also do this in the storyboard but doing it in code looks cleaner. Make sure to conform to the UITableViewDataSource and the UITableViewDelegate.
        self.capitalizeTableView.delegate = self
        self.capitalizeTableView.dataSource = self
//        Setting this to false will disable the users ability to scroll in the tableView.
        self.capitalizeTableView.scrollEnabled = false
        
        self.completeNewTodoTableView.delegate = self
        self.completeNewTodoTableView.dataSource = self
        self.completeNewTodoTableView.scrollEnabled = false
//        This can also be done in the storyboard. This is placed in the middle top part of the nav bar.
        self.title = "Settings"
//        It's smart to make this a constant instead of hardcoding it.
        self.versionLabel.text = kVersionNumber
        
//        This is done to override the default back button in the nav bar. By setting the target equal to self its saying the target is in this view controller.
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneBarButtonItemPressed:"))
//        Updating the button in the navbar.
        self.navigationItem.leftBarButtonItem = doneButton
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    Creating our own version of the back button to done instead of back. This is where we could change the image asset.
    func doneBarButtonItemPressed (barButtonItem:UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
//    Implement the function cellForRowAtIndexPath
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        Right here we're making sure the table view being passed in is the capitalizeTableView.
        if tableView == self.capitalizeTableView {
//            First we have to create the cell of type UITableViewCell. We're gonna be able to obtain the capitalizeCell from the tableView.
            var capitalizeCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("capitalizeCell") as UITableViewCell
//            Checking what row is being passed in.
            if indexPath.row == 0 {
                capitalizeCell.textLabel?.text = "No do not capitalize"
//                This is going to help us decide whether we want to use an accessoryType or not. Apple creates the NSUserDefaults. We're getting back the stored value right now. NSUserDefaults are very light weight and quick for us to access.
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitalizeTaskKey) == false {
//                    If it's currently false we're going to show a checkmark.
                    capitalizeCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                } else {
                    capitalizeCell.accessoryType = UITableViewCellAccessoryType.None
                }
                
            }
            else {
                capitalizeCell.textLabel?.text = "yes capitalize"
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitalizeTaskKey) == true {
                
                    capitalizeCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                } else {
                    capitalizeCell.accessoryType = UITableViewCellAccessoryType.None
                }
            }
            return capitalizeCell
        }
        else {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("completeNewTodo") as UITableViewCell!
            if indexPath.row == 0 {
                cell.textLabel?.text = "Do not complete task"
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCompleteNewToDoKey) == false {
                    cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                } else {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
                
            }
            else {
                cell.textLabel?.text = "Complete task"
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCompleteNewToDoKey) == true {
                    cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                }
                else {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
            }
            return cell 
        }
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        You wouldn't typically hard code the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        You can set this in the story board.
        return 30
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == self.capitalizeTableView {
            return "Capatilize New Task?"
        }
        else {
            return "Complete New Task?"
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.capitalizeTableView {
            if indexPath.row == 0 {
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: kShouldCapitalizeTaskKey)
            }
            else {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: kShouldCapitalizeTaskKey)
            }
        }
        else {
            if indexPath.row == 0 {
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: kShouldCompleteNewToDoKey)
            }
            else {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: kShouldCompleteNewToDoKey)
            }
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        tableView.reloadData()
    }
    
    
    
    
    
}
