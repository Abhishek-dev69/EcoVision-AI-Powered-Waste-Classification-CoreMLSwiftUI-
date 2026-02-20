import Foundation

final class HistoryManager {

    static let shared = HistoryManager()

    private init() {}

    // Fetch history
    func fetch() -> [ScanRecord] {

        LocalStorage.shared.loadHistory()
            .sorted { $0.date > $1.date }
    }

    // Save record
    func save(record: ScanRecord) {

        LocalStorage.shared.save(record: record)
    }

    // Clear history
    func clear() {

        LocalStorage.shared.clearHistory()
    }

    // Delete record
    func delete(record: ScanRecord) {

        LocalStorage.shared.delete(record: record)
    }
}

