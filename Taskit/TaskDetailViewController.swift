//
//  TaskDetailViewController.swift
//  Taskit
//
//  Created by Joshua Kuehn on 12/8/14.
//  Copyright (c) 2014 Joshua Kuehn. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModal:TaskModel!
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var subtaskTextField: UITextField!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModal.task
        self.subtaskTextField.text = detailTaskModal.subTask
        self.dueDatePicker.date = detailTaskModal.date
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }

    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        detailTaskModal.task = taskTextField.text
        detailTaskModal.subTask = subtaskTextField.text
        detailTaskModal.date = dueDatePicker.date
        detailTaskModal.completed = detailTaskModal.completed
        
        appDelegate.saveContext()
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
}
