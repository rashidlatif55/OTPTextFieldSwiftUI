//
//  OTPTextFieldView.swift
//  OTPTextFieldSwiftUI
//
//  Created by Rashid Latif on 26/07/2024.
//

import SwiftUI

struct OTPTextFieldView: View {
    
    @Binding var text: String
    @State var count:Int = 6
    @FocusState var isTextFieldFocused:Bool
    var onComplete: ((_ enteredOtpText:String) -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<count, id: \.self){ index in
                OTPTextBox(index: index)
            }
        }
        .background {
            TextField("", text: self.$text)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
            //Hide textField
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isTextFieldFocused)
                .onChange(of: text) { oldValue , newValue in
                    if newValue.count > self.count { // Set your max length here4
                        text = String(newValue.prefix(self.count))
                    }
                    
                    if newValue.count == count {
                        onComplete?(newValue)
                    }
                }
            
            
        }
        .contentShape(Rectangle())
        
        .onTapGesture {
            self.isTextFieldFocused.toggle()
        }
        .padding(.bottom, 20)
        .padding(.top, 10)
        
    }
    
    
    @ViewBuilder
    func OTPTextBox(index:Int) -> some View {
        ZStack {
            if text.count > index {
                let startIndex = self.text.startIndex
                let characterIndex = self.text.index(startIndex, offsetBy: index)
                let charToString = String(self.text[characterIndex])
                Text(charToString)
                
            }else {
                Text("")
            }
        }
        .frame(minWidth: 44, minHeight: 44)
        .background {
            let status = (self.isTextFieldFocused && self.text.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(
                    status ? .black : .gray,
                    lineWidth: status ? 1 : 0.5
                )
                .animation(.easeInOut(duration: 0.2), value: status)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}

extension View {
    func disableWithOpacity(condition:Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.65 : 1)
    }
}
