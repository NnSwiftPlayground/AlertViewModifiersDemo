//
//  ContentView.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    @State var user: User
    
    var body: some View {
        NavigationStack {
            Form {
                NormalAlertSection()
                UsernameAlertSection(text: "My name is \(user.name)") { newName in
                    user.name = newName
                }
            }
            .navigationTitle("Custom Alerts")
        }
    }
}

// MARK: - UsernameAlertSection
private struct UsernameAlertSection: View {
    @State private var showingFieldAlert = false
    
    let text: String
    let updateUsername: (String) -> Void
    
    var body: some View {
        Section {
            Text(text)
            Button("Update name") {
                showingFieldAlert = true
            }
            .frame(maxWidth: .infinity)
        } header: {
            Text("Text from field alert")
        } footer: {
            Text("The text from the field will automatically clear when the alert disappears so you don't have to worry about manually managing the text.")
        }
        // 🟢 Feature: Displays an alert with a textfield to obtain user input
        .singleFieldAlert(
            "Enter your name",
            isPresented: $showingFieldAlert,
            fieldPrompt: "username...",
            action: updateUsername
        )
    }
}


// MARK: - NormalAlertSection
private struct NormalAlertSection: View {
    @State private var showingNormalAlert = false
    
    var body: some View {
        Section {
            Button("Show Alert") {
                showingNormalAlert = true
            }
            .frame(maxWidth: .infinity)
        }
        // 🟢 Feature: Presents an alert when necessary
        .showingAlert("My Alert", message: "This is a normal alert", isPresented: $showingNormalAlert)
    }
}


// MARK: - Preview
#Preview {
    ContentView(user: .init(id: "0", name: ""))
}
