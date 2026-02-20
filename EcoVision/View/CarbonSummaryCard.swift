import SwiftUI

struct CarbonSummaryCard: View {

    let total: Double
    let today: Double
    let week: Double

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Carbon Footprint")
                .font(.headline)

            summaryRow("Total", total)
            summaryRow("Today", today)
            summaryRow("This Week", week)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            colorScheme == .dark
            ? Color.white.opacity(0.05)
            : Color.white.opacity(0.7)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    colorScheme == .dark
                    ? Color.white.opacity(0.1)
                    : Color.white.opacity(0.5)
                )
        )
        .cornerRadius(20)
        .shadow(
            color: colorScheme == .dark
            ? .black.opacity(0.5)
            : .black.opacity(0.12),
            radius: 12,
            y: 6
        )
    }

    func summaryRow(_ title: String, _ value: Double) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text("\(value, specifier: "%.2f") kg")
                .foregroundColor(.green)
                .fontWeight(.semibold)
        }
    }
}

