//
//  ToDoTaDaApp.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI

@main
struct ToDoTaDaApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RealmManager())
        }
    }
}
