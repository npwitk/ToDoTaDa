//
//  SmallAddButton.swift
//  ToDoTaDa
//
//  Created by Nonprawich I. on 17/12/2024.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.primary)
                .frame(width: 56)
                .shadow(radius: 10, y: 5)
            
            Image(systemName: "plus")
                .font(.title3.bold())
                .foregroundStyle(.white)
        }
        .frame(height: 56)
    }
}

#Preview {
    SmallAddButton()
}
