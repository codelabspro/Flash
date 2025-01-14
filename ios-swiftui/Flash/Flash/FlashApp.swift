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
    
    let container: ModelContainer
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        do {
            let schema = Schema([
                PopQuiz.self,
                QuestionAnswerCombo.self
            ])
            let config = ModelConfiguration(schema: schema)
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure container: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
                LandingContentView()
                .preferredColorScheme(ColorScheme.dark)

        }
        .modelContainer(for: QuestionAnswerCombo.self)
        
    }
    
}
