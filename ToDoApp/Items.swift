//
//  Items.swift
//  ToDoApp
//
//  Created by Madeline Eckhart on 10/25/18.
//  Copyright © 2018 MaddGaming. All rights reserved.
//

import Foundation

class ListItem {
    
    var name: String
    
    public init(name: String) {
        self.name = name
    }
    
}

extension ListItem
{
    public class func getTestData() -> [ListItem] {
        return [
            ListItem(name: "Do OS Homework"),
            ListItem(name: "Study for AI quiz"),
            ListItem(name: "Grade freshman projects"),
            ListItem(name: "Learn lisp")
        ]
    }
    
}












