//
//  LandingWelcomeView.swift
//  Flash
//
//  Created by Coder on 5/9/25.
//


import SwiftUI

// 1. Data structure for each welcome page
struct WelcomePageInfo: Identifiable {
    let id = UUID()
    let imageName: String // System SFSymbol name for simplicity
    let title: String
    let description: String
}

// Sample data for the welcome pages
let welcomePages = [
    WelcomePageInfo(imageName: "figure.walk", title: "Personalized Plans", description: "Get AI-tailored workout and meal plans designed just for you and your goals."),
    WelcomePageInfo(imageName: "list.star", title: "Track Your Progress", description: "Easily log your activities, meals, habits, and mood to see how far you've come."),
    WelcomePageInfo(imageName: "brain.head.profile", title: "Intelligent Insights", description: "Our AI learns from your data to provide helpful insights and adapt your plans for continued success."),
    WelcomePageInfo(imageName: "checkmark.circle.fill", title: "Build Healthy Habits", description: "Stay motivated and consistent with habit tracking, reminders, and wellness check-ins.")
]

// 2. The Welcome View
struct LandingWelcomeView: View {
    @State private var currentPage = 0
    @State private var navigateToLandingContentView = false
    // Action to be performed when "Get Started" is tapped


    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(welcomePages.indices, id: \.self) { index in
                        WelcomePageView(pageInfo: welcomePages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // Shows pagination dots
                .padding(.bottom, 20)
                
                // "Get Started" button on the last page
                if currentPage == welcomePages.count - 1 {
                    Button(action: {
                        navigateToLandingContentView = true
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 30) // Give some space from the bottom
                } else {
                    // Placeholder to maintain height consistency, or you can add a "Next" button
                    Button(action: {
                        withAnimation {
                            currentPage = min(currentPage + 1, welcomePages.count - 1)
                        }
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray) // Different color for "Next"
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 30)
                }
            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $navigateToLandingContentView) {
                LandingContentView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// 3. View for a single welcome page
struct WelcomePageView: View {
    let pageInfo: WelcomePageInfo

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: pageInfo.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 40)

            Text(pageInfo.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text(pageInfo.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .foregroundColor(.gray)
            
            Spacer() // Pushes content to the top and middle
        }
        .padding(.bottom, 50) // Space for pagination dots
    }
}


#Preview {
    LandingWelcomeView()
}
