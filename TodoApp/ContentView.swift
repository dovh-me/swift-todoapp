//
//  ContentView.swift
//  TodoApp
//
//  Created by Osura Httiarachchi on 2024-10-05.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false;
    @StateObject var viewModel = ViewModel();
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if(viewModel.tasks.isEmpty) {
                    ContentUnavailableView("No Tasks",
                                           systemImage: "tray",
                                           description:
                        Text("Add your first task by clicking on + icon above"))
                } else {
                    List(viewModel.tasks) { task in
                            HStack(alignment: .center) {
                                Image(systemName: task.isCompleted ? "circle.fill": "circle").foregroundColor(.blue)
                                
                                VStack(alignment: .leading) {
                                    Text(task.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    Text(task.description).fontWeight(.thin)
                                }
                            }
                                .onTapGesture {
                                    viewModel.toggleTaskState(task: task)
                                }
                    }
                }
            }
            .navigationTitle("Todo App")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        showSheet = true
                    }
                }
            }).sheet(isPresented: $showSheet, content: {
                AddTaskView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    ContentView()
}
