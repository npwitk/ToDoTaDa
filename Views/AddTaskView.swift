//
//  AddTaskView.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var showClearButton: Bool = false
    
    var body: some View {
        NavigationStack {
            
            Text("New Task")
                .font(.title.weight(.bold).width(.expanded))
                .padding()
            VStack(alignment: .leading, spacing: 24) {
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("What needs to be done?")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .trailing) {
                        TextField("Enter your task", text: $title, axis: .vertical)
                            .textFieldStyle(.plain)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.1))
                            }
                            .onChange(of: title) { oldValue, newValue in
                                withAnimation(.snappy) {
                                    showClearButton = !newValue.isEmpty
                                }
                            }
                        
                        if showClearButton {
                            Button {
                                title = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.trailing)
                        }
                    }
                }
                .padding(.horizontal)
                
                
                VStack(spacing: 16) {
                    Button {
                        if !title.isEmpty {
                            withAnimation {
                                realmManager.addTask(taskTitle: title)
                                dismiss()
                            }
                        }
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Task")
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 52)
                        .frame(maxWidth: .infinity)
                        .background(title.isEmpty ? .gray : .primary)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    .disabled(title.isEmpty)
                    
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .padding(.horizontal)
            }

            
            Spacer()
            
        }
    }
}

#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
