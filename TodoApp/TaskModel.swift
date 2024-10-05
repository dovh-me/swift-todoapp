//
//  TaskModel.swift
//  TodoApp
//
//  Created by Osura Httiarachchi on 2024-10-05.
//

import Foundation

struct TaskModel: Identifiable {
    var id = UUID();
    var title: String;
    var description: String;
    var isCompleted: Bool;
    
    init(id: UUID = UUID(), title: String, description: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}
