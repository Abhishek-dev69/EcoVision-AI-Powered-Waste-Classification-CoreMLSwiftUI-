//
//  ContentView.swift
//  EcoVision
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        NavigationStack {

            ZStack {

                // MARK: Premium Eco Gradient Background
                ZStack {

                    LinearGradient(
                        colors: colorScheme == .dark ?
                        [
                            Color.black,
                            Color(red: 0.05, green: 0.1, blue: 0.2)
                        ]
                        :
                        [
                            Color(red: 0.93, green: 0.96, blue: 0.95),
                            Color(red: 0.82, green: 0.88, blue: 0.85)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )

                    RadialGradient(
                        colors: colorScheme == .dark ?
                        [
                            Color.blue.opacity(0.25),
                            Color.clear
                        ]
                        :
                        [
                            Color.green.opacity(0.18),
                            Color.clear
                        ],
                        center: .topTrailing,
                        startRadius: 50,
                        endRadius: 600
                    )
                }
                .ignoresSafeArea()

                VStack(spacing: 24) {

                    Spacer()

                    // MARK: App Icon
                    ZStack {

                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.green, .mint],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 110, height: 110)
                            .shadow(
                                color: .green.opacity(0.4),
                                radius: 20
                            )

                        Image(systemName: "leaf.fill")
                            .font(.system(size: 44))
                            .foregroundColor(.white)
                    }

                    // MARK: Title
                    Text("EcoVision")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(
                            colorScheme == .dark ?
                            .white.opacity(0.9) :
                            .black.opacity(0.75)
                        )

                    // MARK: AI Assistant Description
                    Text("Your AI-powered eco assistant")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark ?
                            .green.opacity(0.8) :
                            .green.opacity(0.8)
                        )

                    // MARK: Explanation
                    Text("Instantly identify waste using on-device AI and learn how your choices impact the environment.")
                        .font(.system(size: 16))
                        .foregroundColor(
                            colorScheme == .dark ?
                            .white.opacity(0.65) :
                            .black.opacity(0.55)
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()

                    // MARK: Feature Highlights
                    VStack(spacing: 16) {

                        FeatureRow(
                            icon: "camera.viewfinder",
                            text: "Scan waste instantly using AI"
                        )

                        FeatureRow(
                            icon: "leaf.arrow.circlepath",
                            text: "Learn environmental impact"
                        )

                        FeatureRow(
                            icon: "globe.americas.fill",
                            text: "Make smarter eco-friendly decisions"
                        )
                    }
                    .padding(.horizontal, 30)

                    Spacer()

                    // MARK: Mission Statement
                    Text("Every scan helps build a cleaner, more sustainable future.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark ?
                            .white.opacity(0.6) :
                            .black.opacity(0.5)
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    Spacer()

                    // MARK: Scan Button
                    NavigationLink {

                        CameraView()

                    } label: {

                        Text("Start Scanning")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.green, .mint],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                            .shadow(
                                color: .green.opacity(0.4),
                                radius: 12,
                                y: 6
                            )
                    }
                    .padding(.horizontal, 30)

                    Spacer().frame(height: 30)
                }
            }
        }
    }
}

struct FeatureRow: View {

    let icon: String
    let text: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.green)
                .frame(width: 28)

            Text(text)
                .font(.system(size: 15))
                .foregroundColor(
                    colorScheme == .dark ?
                    .white.opacity(0.75) :
                    .black.opacity(0.6)
                )

            Spacer()
        }
    }
}

