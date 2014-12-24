//
//  Date.swift
//  Taskit
//
//  Created by Joshua Kuehn on 12/8/14.
//  Copyright (c) 2014 Joshua Kuehn. All rights reserved.
//

import Foundation

class Date {
    class func from (#year:Int,month:Int,day:Int) ->NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        
        
        return date!
    }
    
    class func toString(#date:NSDate) -> String {
        
//        Created a NSDateFormatter Instance
        let dateStringFormatter = NSDateFormatter()
//        There are other types of date formats that can also be used.(This is the date property)
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
//        converted to a string here
        let dateString = dateStringFormatter.stringFromDate(date)
        
        
        
        
        
        
        return dateString
    }
    
}
