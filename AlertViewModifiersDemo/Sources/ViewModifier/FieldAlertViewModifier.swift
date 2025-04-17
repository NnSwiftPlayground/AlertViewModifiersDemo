//
//  FieldAlertViewModifier.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct FieldAlertViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    @State private var fieldText = ""

    let message: String
    let actionButtonInfo: AlertButtonInfo
    let cancelButtonInfo: AlertButtonInfo
    let action: (String) -> Void
    
    private func save() {
        action(fieldText)
        clearField()
    }
    
    private func clearField() {
        fieldText = ""
    }
    
    func body(content: Content) -> some View {
        content
            .customAlert(message, isPresented: $isPresented, cancelButtonInfo: cancelButtonInfo, cancelAction: clearField) {
                TextField("", text: $fieldText)
                Button(actionButtonInfo.text, role: actionButtonInfo.role, action: save)
            }
    }
}

extension View {
    func singleFieldAlert(
        _ message: String,
        isPresented: Binding<Bool>,
        actionButtonInfo: AlertButtonInfo = .save,
        cancelButtonInfo: AlertButtonInfo = .cancel,
        action: @escaping (String) -> Void
    ) -> some View {
        modifier(
            FieldAlertViewModifier(
                isPresented: isPresented,
                message: message,
                actionButtonInfo: actionButtonInfo,
                cancelButtonInfo: cancelButtonInfo,
                action: action
            )
        )
    }
}
