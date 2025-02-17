//
//  FlashTabsView.swift
//  Flash
//
//  Created by Coder on 1/12/25.
//

import SwiftUI

struct FlashTabsView: View {
    var body: some View {
        TabView {
            TabOneView()
                .tabItem {
                    Label("Test Creator", systemImage: "person.crop.circle")
                }
            
            TabTwoView()
                .tabItem {
                    Label("Pop Quizzes", systemImage: "checkmark.circle")
                }
            
            TabThreeView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    FlashTabsView()
}
