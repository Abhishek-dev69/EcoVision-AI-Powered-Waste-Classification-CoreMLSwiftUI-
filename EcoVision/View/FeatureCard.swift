import SwiftUI

struct FeatureCard: View {

    let title: String
    let subtitle: String
    let icon: String

    @Environment(\.colorScheme) private var colorScheme

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: colorScheme == .dark
            ? [
                Color.black,
                Color(red: 0.05, green: 0.10, blue: 0.18)
            ]
            : [
                Color(red: 0.93, green: 0.96, blue: 0.95),
                Color(red: 0.82, green: 0.88, blue: 0.85)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {

        ZStack {

            backgroundGradient

            // 🌿 Eco Glow Overlay
            RadialGradient(
                colors: [
                    Color.green.opacity(colorScheme == .dark ? 0.35 : 0.20),
                    Color.clear
                ],
                center: .topTrailing,
                startRadius: 20,
                endRadius: 250
            )

            // ✨ Glass Layer
            RoundedRectangle(cornerRadius: 28)
                .fill(
                    colorScheme == .dark
                    ? Color.white.opacity(0.06)
                    : Color.white.opacity(0.6)
                )
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 28))

            // Content
            HStack {

                VStack(alignment: .leading, spacing: 6) {

                    Text(title)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(
                            colorScheme == .dark ? .white : .black.opacity(0.75)
                        )

                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(
                            colorScheme == .dark
                            ? .white.opacity(0.65)
                            : .black.opacity(0.6)
                        )
                }

                Spacer()

                ZStack {

                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.green, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                        .shadow(
                            color: .green.opacity(0.6),
                            radius: 18,
                            y: 8
                        )

                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 22)
        }
        .frame(height: 130)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(
            color: colorScheme == .dark
            ? Color.black.opacity(0.6)
            : Color.black.opacity(0.15),
            radius: 16,
            y: 8
        )
    }
}

