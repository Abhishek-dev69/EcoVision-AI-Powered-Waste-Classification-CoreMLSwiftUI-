import SwiftUI

struct EcoScoreView: View {

    let score: Int

    var body: some View {

        VStack {

            Text("Eco Score")
                .font(.headline)

            Text("\(score)")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.green)

            Text(scoreDescription)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }

    var scoreDescription: String {

        switch score {

        case 80...100: return "Excellent"
        case 60...79: return "Good"
        case 40...59: return "Average"
        default: return "Needs improvement"
        }
    }
}

