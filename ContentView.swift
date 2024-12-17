//
//  ContentView.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .frame(width: 80)
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
                .presentationDetents([.height(320)])
                .presentationCornerRadius(25)
        }
        .onAppear {
            realmManager.getTasks()
        }
        
        
    }
}

#Preview {
    ContentView()
}
