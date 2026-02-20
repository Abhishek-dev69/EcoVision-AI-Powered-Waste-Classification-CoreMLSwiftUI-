import SwiftUI

struct HistoryView: View {

    @StateObject private var vm = HistoryViewModel()

    var body: some View {

        List(vm.records) { record in

            VStack(alignment: .leading, spacing: 6) {

                Text(record.label)
                    .font(.headline)

                Text("\(record.carbonFootprint, specifier: "%.2f") kg CO₂e")
                    .foregroundColor(.green)

                Text(record.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Scan History")
        .onAppear {

            vm.load()
        }
    }
}

