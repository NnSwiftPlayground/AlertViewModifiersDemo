//
//  ShowingAlertViewModifier.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct ShowingAlertViewModifier: ViewModifier {
    @Binding var presented: Bool
    
    let title: String
    let message: String
    let buttonInfo: AlertButtonInfo
    let finished: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .alert(title, isPresented: $presented) {
                Button(buttonInfo.text, role: buttonInfo.role) {
                    finished?()
                }
            } message: {
                Text(message)
            }
    }
}

extension View {
    /// Presents a standard SwiftUI alert with a single button.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message content of the alert.
    ///   - isPresented: Binding that determines whether the alert is shown.
    ///   - buttonInfo: Information for the alert's button (defaults to `.okay`).
    ///   - finished: Optional closure to run when the button is tapped.
    func showingAlert(_ title: String, message: String, isPresented: Binding<Bool>, buttonInfo: AlertButtonInfo = .okay, finished: (() -> Void)? = nil) -> some View {
        modifier(ShowingAlertViewModifier(presented: isPresented, title: title, message: message, buttonInfo: buttonInfo, finished: finished))
    }
}
