//
//  Login.swift
//  LoginKit
//
//  Created by Tester on 2/10/24.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup : Bool
    /// View Properties
    @State private var emailID : String = ""
    @State private var password: String = ""
    @State private var showForgotPassowordView: Bool = false
    @State private var showResetView: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength : 0)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing:25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Forgot Password?") {
                    showForgotPassowordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .hSpacing(.trailing)
                
                /// Login Button
                GradientButton(title: "Login", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                
            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                
                Button("SignUp") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden,for: .navigationBar)
        .sheet(isPresented: $showForgotPassowordView, content: {
            if #available(iOS 16.4, *) {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    
            }
        })
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    
            }
        })
    }
}

#Preview {
    ContentView()
}
