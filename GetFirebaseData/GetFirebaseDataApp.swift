//
//  GetFirebaseDataApp.swift
//  GetFirebaseData
//
//  Created by mark me on 11/10/22.
//

import SwiftUI
import Firebase

@main
struct GetFirebaseDataApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
