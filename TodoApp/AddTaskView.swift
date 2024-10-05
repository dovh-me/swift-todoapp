//
//  AddTaskView.swift
//  TodoApp
//
//  Created by Osura Httiarachchi on 2024-10-05.
//

import SwiftUI

struct AddTaskView: View {
    @State var title: String = "";
    @State var description: String = "";
    @ObservedObject var viewModel: ViewModel;
    
    @Environment(\.dismiss) var dismiss;
    
    func resetFields() {
        title = "";
        description = "";
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Enter Title", text: $title)
                    TextField("Enter Description", text: $description)
                }.autocorrectionDisabled()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        resetFields()
                        dismiss()
                    }.tint(.red)
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Add New Task")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let itemToAdd = TaskModel(title: title, description: description)
                        
                        viewModel.addTask(task: itemToAdd)
                        
                        dismiss()
                        resetFields()
                    }.tint(.blue)
                }
            }
        }
    }
}

#Preview {
    AddTaskView(viewModel: ViewModel())
}
