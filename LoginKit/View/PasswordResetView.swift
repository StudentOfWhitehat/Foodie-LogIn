//
//  PasswordResetView.swift
//  LoginKit
//
//  Created by Tester on 2/11/24.
//

import SwiftUI

struct PasswordResetView: View {
    /// View Properties
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                
            },label : {
                Image(systemName : "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,5)
            
            VStack(spacing:25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "lock", hint: "Password", value: $password)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)
                
                
                    .padding(.top, 5)
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
                
            }
            .padding(.top,20)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
    
    
    
    
    #Preview {
        ContentView()
    }
}
