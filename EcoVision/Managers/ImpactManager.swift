import Foundation

final class ImpactManager {

    static let shared = ImpactManager()

    private init() {}

    func calculateEcoScore() -> Int {

        let history = HistoryManager.shared.fetch()

        let recyclableCount = history.filter {

            Items.forLabel($0.label)?.recyclable == true

        }.count

        return recyclableCount * 10
    }

    func totalCO2Saved() -> Double {

        let history = HistoryManager.shared.fetch()

        return history.reduce(0) { result, record in

            result + record.carbonFootprint
        }
    }
}

