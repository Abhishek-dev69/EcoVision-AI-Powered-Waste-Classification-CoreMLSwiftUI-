import SwiftUI

struct FeatureCard: View {

    let title: String
    let subtitle: String
    let gradient: [Color]
    let icon: String

    @Environment(\.colorScheme) private var colorScheme

    // MARK: Adaptive Gradient
    private var adaptiveGradient: [Color] {

        if colorScheme == .dark {

            // Dark mode → uniform premium glass gradient
            return [
                Color.white.opacity(0.05),
                Color.white.opacity(0.02)
            ]

        } else {

            // Light mode → original colorful gradients
            return gradient
        }
    }

    var body: some View {

        ZStack {

            // MARK: Adaptive Base Gradient
            LinearGradient(
                colors: adaptiveGradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            // MARK: Glass Layer
            RoundedRectangle(cornerRadius: 28)
                .fill(
                    LinearGradient(
                        colors: colorScheme == .dark
                        ? [
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.02)
                        ]
                        : [
                            Color.white.opacity(0.6),
                            Color.white.opacity(0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            // MARK: Content
            HStack {

                VStack(alignment: .leading, spacing: 6) {

                    Text(title)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(
                            colorScheme == .dark
                            ? Color.white
                            : Color.black.opacity(0.75)
                        )

                    Text(subtitle)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(
                            colorScheme == .dark
                            ? Color.white.opacity(0.65)
                            : Color.black.opacity(0.55)
                        )
                }

                Spacer()

                // MARK: Icon
                ZStack {

                    Circle()
                        .fill(
                            colorScheme == .dark
                            ? Color.white.opacity(0.08)
                            : Color.white.opacity(0.7)
                        )
                        .background(.ultraThinMaterial)
                        .frame(width: 64, height: 64)

                    Circle()
                        .stroke(
                            colorScheme == .dark
                            ? Color.white.opacity(0.15)
                            : Color.white.opacity(0.9),
                            lineWidth: 1
                        )
                        .frame(width: 64, height: 64)

                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(
                            colorScheme == .dark
                            ? Color.white
                            : Color.black.opacity(0.7)
                        )
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
        }
        .frame(height: 130)
        .clipShape(RoundedRectangle(cornerRadius: 28))

        // MARK: Border
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(
                    colorScheme == .dark
                    ? Color.white.opacity(0.12)
                    : Color.white.opacity(0.9),
                    lineWidth: 1
                )
        )

        // MARK: Shadow
        .shadow(
            color: colorScheme == .dark
            ? Color.black.opacity(0.6)
            : Color.black.opacity(0.15),
            radius: colorScheme == .dark ? 20 : 12,
            y: 8
        )
    }
}

