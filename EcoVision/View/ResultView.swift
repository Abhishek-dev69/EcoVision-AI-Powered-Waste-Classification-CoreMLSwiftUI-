//
//  ResultView.swift
//  EcoVision
//

import SwiftUI

struct ResultView: View {

    let result: DetectionResult?

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var body: some View {

        ZStack {

            // MARK: Premium Gradient Background (same as other screens)
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

            VStack(spacing: 0) {

                // MARK: Top Bar
                HStack {

                    Button {
                        dismiss()
                    } label: {

                        ZStack {

                            Circle()
                                .fill(
                                    colorScheme == .dark ?
                                    Color.white.opacity(0.1) :
                                    Color.white.opacity(0.6)
                                )
                                .frame(width: 44, height: 44)

                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(
                                    colorScheme == .dark ?
                                    .white :
                                    .black
                                )
                        }
                    }

                    Spacer()

                    Text("RESULT")
                        .font(.system(size: 18, weight: .semibold))
                        .kerning(3)
                        .foregroundColor(
                            colorScheme == .dark ?
                            .white.opacity(0.9) :
                            .black.opacity(0.7)
                        )

                    Spacer()

                    Circle()
                        .fill(Color.clear)
                        .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                // MARK: Content
                if let result,
                   let item = Items.forLabel(result.label) {

                    ScrollView {

                        VStack(spacing: 22) {

                            Spacer().frame(height: 20)

                            // MARK: Waste Icon
                            Image(systemName: item.recyclable ? "leaf.circle.fill" : "exclamationmark.triangle.fill")
                                .font(.system(size: 64))
                                .foregroundColor(item.recyclable ? .green : .orange)
                                .shadow(radius: 10)

                            // MARK: Title
                            Text(item.title)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(
                                    colorScheme == .dark ?
                                    .white :
                                    .black.opacity(0.8)
                                )
                                .multilineTextAlignment(.center)

                            // MARK: Confidence
                            Text("AI Confidence: \(Int(result.confidence * 100))%")
                                .font(.system(size: 16))
                                .foregroundColor(
                                    colorScheme == .dark ?
                                    .white.opacity(0.7) :
                                    .black.opacity(0.6)
                                )

                            // MARK: Info Card
                            VStack(spacing: 18) {

                                infoRow(
                                    title: "Carbon Footprint",
                                    value: String(format: "%.2f kg CO₂e", item.carbonFootprint),
                                    color: .green
                                )

                                infoRow(
                                    title: "Disposal Method",
                                    value: item.disposalMethod
                                )

                                infoRow(
                                    title: "Decomposition Time",
                                    value: item.decompositionTime
                                )

                                infoRow(
                                    title: "Environmental Impact",
                                    value: item.impactExplanation
                                )

                                infoRow(
                                    title: "Better Alternative",
                                    value: item.suggestion
                                )

                                HStack {

                                    Image(systemName:
                                            item.recyclable ?
                                            "checkmark.circle.fill" :
                                            "xmark.circle.fill"
                                    )
                                    .foregroundColor(
                                        item.recyclable ? .green : .red
                                    )

                                    Text(
                                        item.recyclable ?
                                        "Recyclable Material" :
                                        "Not Recyclable"
                                    )
                                    .font(.system(size: 16, weight: .medium))
                                }

                            }
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        colorScheme == .dark ?
                                        Color.white.opacity(0.05) :
                                        Color.white.opacity(0.7)
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        Color.white.opacity(
                                            colorScheme == .dark ? 0.1 : 0.5
                                        )
                                    )
                            )

                            Spacer().frame(height: 30)
                        }
                        .padding(.horizontal, 20)
                    }

                } else {

                    Spacer()

                    VStack(spacing: 12) {

                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)

                        Text("Unable to classify image")
                            .font(.headline)
                            .foregroundColor(
                                colorScheme == .dark ?
                                .white :
                                .black
                            )
                    }

                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }


    // MARK: Info Row Component
    func infoRow(title: String, value: String, color: Color? = nil) -> some View {

        VStack(spacing: 4) {

            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(
                    colorScheme == .dark ?
                    .white.opacity(0.6) :
                    .black.opacity(0.5)
                )

            Text(value)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(color ?? (
                    colorScheme == .dark ?
                    .white :
                    .black.opacity(0.8)
                ))
                .multilineTextAlignment(.center)
        }
    }
}

