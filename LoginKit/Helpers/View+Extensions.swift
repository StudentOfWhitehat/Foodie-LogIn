//
//  View+Extensions.swift
//  LoginKit
//
//  Created by Tester on 2/10/24.
//

import SwiftUI

/// Custom SwiftUI View Extensions
extension View {
    /// View Alignments
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment : alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment : Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    /// Disable With Opacity
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
