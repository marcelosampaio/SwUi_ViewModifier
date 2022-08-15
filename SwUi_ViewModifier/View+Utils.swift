//
//  View+Utils.swift
//  SwUi_ViewModifier
//
//  Created by Marcelo Sampaio on 15/08/22.
//

import SwiftUI

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}

