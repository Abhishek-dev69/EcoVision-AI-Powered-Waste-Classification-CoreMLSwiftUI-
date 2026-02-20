import SwiftUI
import Charts

struct CarbonChartView: View {

    let data: [CarbonDataPoint]

    var body: some View {

        VStack(alignment: .leading) {

            Text("Weekly Carbon Impact")
                .font(.headline)

            Chart(data) {

                LineMark(
                    x: .value("Day", $0.date, unit: .day),
                    y: .value("CO₂", $0.value)
                )
                .foregroundStyle(.green)

                AreaMark(
                    x: .value("Day", $0.date, unit: .day),
                    y: .value("CO₂", $0.value)
                )
                .foregroundStyle(.green.opacity(0.2))
            }
            .frame(height: 200)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

