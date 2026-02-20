//
//  ContentView.swift
//  EcoVision
//
//  WWDC-level Eco AI Assistant Entry Screen
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {

        NavigationStack {

            ZStack {

                // MARK: Background
                EcoGradientBackground()

                VStack(spacing: 28) {

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
                            .frame(width: 120, height: 120)
                            .shadow(
                                color: .green.opacity(colorScheme == .dark ? 0.6 : 0.35),
                                radius: 25,
                                y: 10
                            )

                        Image(systemName: "leaf.fill")
                            .font(.system(size: 46, weight: .semibold))
                            .foregroundColor(.white)
                    }

                    // MARK: Title
                    Text("EcoVision")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(
                            colorScheme == .dark
                            ? .white
                            : .black.opacity(0.8)
                        )

                    // MARK: Subtitle
                    Text("Your AI-powered eco assistant")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.green)

                    // MARK: Description
                    Text("Identify waste instantly using on-device AI")
                        .font(.system(size: 16))
                        .foregroundColor(
                            colorScheme == .dark
                            ? .white.opacity(0.7)
                            : .black.opacity(0.6)
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    Spacer()

                    // MARK: Feature List
                    VStack(spacing: 18) {

                        FeatureRow(
                            icon: "camera.viewfinder",
                            text: "Real-time waste detection"
                        )

                        FeatureRow(
                            icon: "leaf.arrow.circlepath",
                            text: "Environmental impact insights"
                        )

                        FeatureRow(
                            icon: "brain.head.profile",
                            text: "Runs fully on-device using CoreML"
                        )

                        FeatureRow(
                            icon: "globe.americas.fill",
                            text: "Build sustainable habits"
                        )
                    }
                    .padding(.horizontal, 36)

                    Spacer()

                    Text("Every scan contributes to a greener future.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark
                            ? .white.opacity(0.6)
                            : .black.opacity(0.5)
                        )

                    Spacer()

                    // MARK: Buttons
                    VStack(spacing: 16) {

                        NavigationLink {
                            CameraView()
                        } label: {

                            MainButton(title: "Start Scanning", icon: "camera.fill")
                        }

                        NavigationLink {
                            DashboardView()
                        } label: {

                            SecondaryButton(title: "View Dashboard", icon: "chart.bar.fill")
                        }
                    }
                    .padding(.horizontal, 30)

                    Spacer().frame(height: 30)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}

//////////////////////////////////////////////////////////////
// MARK: Feature Row
//////////////////////////////////////////////////////////////

struct FeatureRow: View {

    let icon: String
    let text: String

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.green)
                .frame(width: 28)

            Text(text)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(
                    colorScheme == .dark
                    ? .white.opacity(0.8)
                    : .black.opacity(0.7)
                )

            Spacer()
        }
    }
}

//////////////////////////////////////////////////////////////
// MARK: Eco Gradient Background
//////////////////////////////////////////////////////////////

struct EcoGradientBackground: View {

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {

        ZStack {

            LinearGradient(
                colors: colorScheme == .dark
                ? [
                    Color.black,
                    Color(red: 0.04, green: 0.08, blue: 0.15)
                ]
                : [
                    Color(red: 0.93, green: 0.96, blue: 0.95),
                    Color(red: 0.82, green: 0.88, blue: 0.85)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            RadialGradient(
                colors: [
                    Color.green.opacity(colorScheme == .dark ? 0.25 : 0.18),
                    Color.clear
                ],
                center: .topTrailing,
                startRadius: 40,
                endRadius: 600
            )
        }
        .ignoresSafeArea()
    }
}

//////////////////////////////////////////////////////////////
// MARK: Buttons
//////////////////////////////////////////////////////////////

struct MainButton: View {

    let title: String
    let icon: String

    var body: some View {

        HStack {

            Spacer()

            Image(systemName: icon)

            Text(title)

            Spacer()
        }
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(.white)
        .padding()
        .background(
            LinearGradient(
                colors: [.green, .mint],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(18)
        .shadow(color: .green.opacity(0.4), radius: 14, y: 8)
    }
}

struct SecondaryButton: View {

    let title: String
    let icon: String

    var body: some View {

        HStack {

            Spacer()

            Image(systemName: icon)

            Text(title)

            Spacer()
        }
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(.green)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.green.opacity(0.15))
        )
    }
}

