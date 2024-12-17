//
//  TasksView.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI
import RealmSwift

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        NavigationStack {

            Text(realmManager.tasks.count < 2 ? "My Task" : "My Tasks")
                .font(.title.weight(.bold).width(.expanded))
                .contentTransition(.numericText())
                .animation(.snappy, value: realmManager.tasks.count)
            
            Group {
                if realmManager.tasks.isEmpty {
                    ContentUnavailableView(
                        "No Tasks",
                        systemImage: "checklist",
                        description: Text("Tasks you create will appear here.\nTap the + button to get started.")
                    )
                } else {
                    List {
                        ForEach(realmManager.tasks, id: \.id) { task in
                            if !task.isInvalidated {
                                TaskRow(task: task.title, completed: task.completed)
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.3)) {
                                            realmManager.updateTask(id: task.id, completed: !task.completed)
                                        }
                                    }
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            withAnimation {
                                                realmManager.deleteTask(id: task.id)
                                            }
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                    }
                    .listStyle(.inset)
                }
            }
            
        }
    }
}

#Preview {
    TasksView()
        .environmentObject(RealmManager())
}
