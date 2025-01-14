//
//  OverlayMenuView.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import SwiftUI

struct OverlayMenuView: View {
    @Binding var isPresented: Bool
    @Binding var showNewQuestion: Bool
    @Binding var showNewPopQuiz: Bool
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }
            
            // Menu content
            VStack(spacing: 0) {
                MenuButton(title: "Pop Quiz", icon: "list.bullet.clipboard.fill") {
                    handleSelection(isPopQuiz: true)
                }
                
                Divider()
                    .background(.white)
                
                MenuButton(title: "Question", icon: "questionmark.circle.fill") {
                    handleSelection(isPopQuiz: false)
                }
            }
            .frame(width: 200)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 20)
            }
            .offset(y: -60) // Position above center
        }
    }
    
    private func handleSelection(isPopQuiz: Bool) {
        withAnimation {
            isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if isPopQuiz {
                    showNewPopQuiz = true
                } else {
                    showNewQuestion = true
                }
            }
        }
    }
}

private struct MenuButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.headline)
                Spacer()
            }
            .foregroundStyle(.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
    }
}
