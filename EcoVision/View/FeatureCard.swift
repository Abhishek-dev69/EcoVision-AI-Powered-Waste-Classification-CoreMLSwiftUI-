import SwiftUI

struct FeatureCard: View {

    let title: String
    let subtitle: String
    let gradient: [Color]
    let icon: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        ZStack {

            // Base pastel gradient
            LinearGradient(
                colors: gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            // Glass overlay
            LinearGradient(
                colors: [
                    Color.white.opacity(colorScheme == .dark ? 0.06 : 0.25),
                    Color.white.opacity(colorScheme == .dark ? 0.02 : 0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack {

                VStack(alignment: .leading, spacing: 8) {

                    Text(title)
                        .font(.system(size: 26, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark ?
                            Color.white.opacity(0.9) :
                            Color.black.opacity(0.65)
                        )

                    Text(subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(
                            colorScheme == .dark ?
                            Color.white.opacity(0.55) :
                            Color.black.opacity(0.45)
                        )
                }

                Spacer()

                // Icon Circle
                ZStack {

                    Circle()
                        .fill(
                            Color.white.opacity(colorScheme == .dark ? 0.08 : 0.35)
                        )
                        .frame(width: 64, height: 64)

                    Circle()
                        .stroke(
                            Color.white.opacity(0.4),
                            lineWidth: 1
                        )
                        .frame(width: 64, height: 64)

                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark ?
                            Color.white.opacity(0.85) :
                            Color.black.opacity(0.6)
                        )
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
        }
        .frame(height: 130)
        .cornerRadius(28)

        // Thin elegant border
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(
                    Color.white.opacity(colorScheme == .dark ? 0.08 : 0.5),
                    lineWidth: 1
                )
        )

        // Soft shadow
        .shadow(
            color: Color.black.opacity(colorScheme == .dark ? 0.5 : 0.12),
            radius: 18,
            y: 10
        )
    }
}

