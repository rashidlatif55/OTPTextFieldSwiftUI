//
//  OTPTextFieldSwiftUIApp.swift
//  OTPTextFieldSwiftUI
//
//  Created by Rashid Latif on 26/07/2024.
//

import SwiftUI

@main
struct OTPTextFieldSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
