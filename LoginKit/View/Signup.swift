//
//  Signup.swift
//  LoginKit
//
//  Created by Tester on 2/11/24.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup : Bool
    /// View Properties
    @State private var emailID : String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                showSignup = false
            },label : {
                Image(systemName : "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,25)
            
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing:25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "person", hint: "Full Name", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                /// SignUp Button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
                
            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                
                Button("Login") {
                    showSignup = false
                }
                .fontWeight(.bold)
                .tint(.yellow)
                
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden,for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
