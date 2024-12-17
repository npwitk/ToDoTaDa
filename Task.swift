//
//  Task.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId // resembles UUID()
    @Persisted var title = ""
    @Persisted var completed = false
}
