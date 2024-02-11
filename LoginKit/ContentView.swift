//
//  ContentView.swift
//  LoginKit
//
//  Created by Tester on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            Login(showSignup : $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                }
        }
        .overlay {
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
