//
//  ViewModel.swift
//  TodoApp
//
//  Created by Osura Httiarachchi on 2024-10-05.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [];
    
    func addTask(task: TaskModel) {
        tasks.append(task);
    }
    
    func toggleTaskState(task: TaskModel) {
        let id = task.id
        let itemIndex = tasks.firstIndex(where: { $0.id == id})
        
        guard let unwarappedIndex = itemIndex else { return }
        
        tasks[unwarappedIndex].isCompleted.toggle()
    }
}
