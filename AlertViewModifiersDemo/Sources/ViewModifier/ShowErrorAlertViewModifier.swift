//
//  ShowErrorAlertViewModifier.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import SwiftUI

struct ShowErrorAlertViewModifier: ViewModifier {
    @Binding var error: Error?
    
    let title: String

    func body(content: Content) -> some View {
        content
            .showingAlert(title, message: error?.localizedDescription ?? "An error has occured", isPresented: .constant(error != nil))
    }
}

extension View {
    func showingError(error: Binding<Error?>, title: String = "Error") -> some View {
        modifier(ShowErrorAlertViewModifier(error: error, title: title))
    }
}

