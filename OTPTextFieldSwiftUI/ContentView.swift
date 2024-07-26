//
//  ContentView.swift
//  OTPTextFieldSwiftUI
//
//  Created by Rashid Latif on 26/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                OTPTextFieldView(text: $text) { enteredOtpText in
                    print(enteredOtpText)
                }
                
                Button {
                    // Verification logic
                } label: {
                    Text("Verify")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous).fill(.blue)
                        )
                }
                .disableWithOpacity(condition: text.count < 6)
            }
            .padding(.horizontal, 15)
            .navigationTitle("Verify OTP")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
