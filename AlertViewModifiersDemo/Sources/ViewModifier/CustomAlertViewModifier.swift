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
