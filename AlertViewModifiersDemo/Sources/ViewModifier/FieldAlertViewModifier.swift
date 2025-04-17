//
//  FieldAlertViewModifier.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct FieldAlertViewModifier: ViewModifier {
    @State var fieldText: String
    @Binding var isPresented: Bool

    let message: String
    let fieldPrompt: String
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
                TextField(fieldPrompt, text: $fieldText)
                Button(actionButtonInfo.text, role: actionButtonInfo.role, action: save)
            }
    }
}

extension View {
    func singleFieldAlert(
        _ message: String,
        isPresented: Binding<Bool>,
        initialText: String = "",
        fieldPrompt: String = "enter text...",
        actionButtonInfo: AlertButtonInfo = .save,
        cancelButtonInfo: AlertButtonInfo = .cancel,
        action: @escaping (String) -> Void
    ) -> some View {
        modifier(
            FieldAlertViewModifier(
                fieldText: initialText,
                isPresented: isPresented,
                message: message,
                fieldPrompt: fieldPrompt,
                actionButtonInfo: actionButtonInfo,
                cancelButtonInfo: cancelButtonInfo,
                action: action
            )
        )
    }
}
