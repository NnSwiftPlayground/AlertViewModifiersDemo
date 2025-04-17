//
//  AlertButtonInfo.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/17/25.
//

import SwiftUI

struct AlertButtonInfo {
    let text: String
    let role: ButtonRole?
}


// MARK: - Helpers
extension AlertButtonInfo {
    static var okay: AlertButtonInfo {
        return .init(text: "Okay", role: .cancel)
    }
    
    static var cancel: AlertButtonInfo {
        return .init(text: "Cancel", role: .cancel)
    }
    
    static var save: AlertButtonInfo {
        return .init(text: "Save", role: .destructive)
    }
}
