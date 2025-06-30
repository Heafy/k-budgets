//
//  SettingsView.swift
//  K Budgets
//
//  Created by Jorge Martinez on 27/06/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("General") {
                    Label("Section", systemImage: "folder.circle")
                    Text("Hello, world!")
                    List {
                         NavigationLink(destination: Text("Navigation Link in Form")) {
                             Text("Navigation Link in Form")
                         }
                     }
                }
            }
        }.navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
