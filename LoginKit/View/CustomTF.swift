//
//  CustomTF.swift
//  LoginKit
//
//  Created by Tester on 2/10/24.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    /// Hides TextField
    var isPassword: Bool = false
    @Binding var value: String
    /// View Properties
    @State private var showPassword: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8,content: {
            Image(systemName : sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                /// Slightly Bringing Down
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        /// Revealing Password when users want to show Password
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                    
                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                /// Password Reveal Button
                if isPassword {
                    Button(action: {
                    withAnimation {
                        showPassword.toggle()
                    }
                }, label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(.gray)
                        .padding(10)
                        .contentShape(.rect)
                })
            }
        }
    })
}
               }
