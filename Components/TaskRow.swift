//
//  TaskRow.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 22))
                .foregroundStyle(completed ? .green : .gray)
                .contentTransition(.symbolEffect(.replace))
                .animation(.snappy, value: completed)
            
            Text(task)
                .font(.body)
                .strikethrough(completed, color: .secondary)
                .foregroundStyle(completed ? .secondary : .primary)
                .animation(.snappy, value: completed)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    TaskRow(task: "Do laundry", completed: true)
}
