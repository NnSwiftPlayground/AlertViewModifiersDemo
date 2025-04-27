//
//  CustomError.swift
//  AlertViewModifiersDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import Foundation

struct CustomError: LocalizedError {
    let message: String

    var errorDescription: String? {
        message
    }
}
