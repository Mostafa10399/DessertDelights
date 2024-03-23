//
//  View+IfModifier.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
