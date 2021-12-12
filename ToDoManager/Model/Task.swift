//
//  Task.swift
//  ToDoManager
//
//  Created by Roman Korobskoy on 09.12.2021.
//

import Foundation

protocol TaskProtocol {
    
    var title: String { get set }
    var type: TaskPriority { get set }
    var status: TaskStatus { get set }
}

struct Task: TaskProtocol {
    
    var title: String
    var type: TaskPriority
    var status: TaskStatus 
    }

enum TaskPriority {
    
    case normal
    case important
}

enum TaskStatus: Int {
    
    case planned
    case completed
}


