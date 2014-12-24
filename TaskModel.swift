//
//  TaskModel.swift
//  Taskit
//
//  Created by Joshua Kuehn on 12/13/14.
//  Copyright (c) 2014 Joshua Kuehn. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var subTask: String
    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber

}
