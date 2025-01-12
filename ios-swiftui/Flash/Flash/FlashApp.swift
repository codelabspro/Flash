//
//  FlashApp.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//

import SwiftUI
import SwiftData


@main
struct FlashApp: App {
    var body: some Scene {
        WindowGroup {
                LandingContentView()
                .preferredColorScheme(ColorScheme.dark)

        }
        .modelContainer(for: QuestionAnswerCombo.self)
        
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
