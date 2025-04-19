//
//  CustomAlertViewModifier.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct CustomAlertViewModifier<AlertView: View>: ViewModifier {
    @Binding var isPresented: Bool
    
    let message: String
    let cancelButtonInfo: AlertButtonInfo?
    let cancelAction: () -> Void
    let alertView: () -> AlertView
    
    func body(content: Content) -> some View {
        content
            .alert(message, isPresented: $isPresented) {
                alertView()
                
                if let cancelButtonInfo {
                    Button(cancelButtonInfo.text, role: cancelButtonInfo.role, action: cancelAction)
                }
            }
    }
}

extension View {
    /// Presents a customizable SwiftUI alert with a custom view for the alert's buttons.
    ///
    /// - Parameters:
    ///   - message: The message content of the alert.
    ///   - isPresented: Binding that determines whether the alert is shown.
    ///   - cancelButtonInfo: Information for the cancel button (optional, defaults to `.cancel`).
    ///   - cancelAction: Action to perform when cancel is selected (defaults to empty).
    ///   - alertView: Closure that provides the custom alert view content.
    func customAlert<AlertView: View>(
        _ message: String,
        isPresented: Binding<Bool>,
        cancelButtonInfo: AlertButtonInfo? = .cancel,
        cancelAction: @escaping () -> Void = { },
        @ViewBuilder alertView: @escaping () -> AlertView
    ) -> some View {
        modifier(
            CustomAlertViewModifier(
                isPresented: isPresented,
                message: message,
                cancelButtonInfo: cancelButtonInfo,
                cancelAction: cancelAction,
                alertView: alertView
            )
        )
    }
}
