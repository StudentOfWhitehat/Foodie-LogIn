//
//  ForgotPassword.swift
//  LoginKit
//
//  Created by Tester on 2/11/24.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView : Bool
    /// View Properties
    @State private var emailID : String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                
            },label : {
                Image(systemName : "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,5)
            
            Text("Please enter your Email ID so that we can send the reset link")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing:25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                    .padding(.top, 5)
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
                
            }
            .padding(.top,20)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()        }
    
    
    
    #Preview {
        ContentView()
    }
}
