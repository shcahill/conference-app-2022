import appioscombined

public struct TimetableTimeGroupItems: Identifiable, Equatable, Hashable {
    public struct Duration: Hashable {
        public let startsAt: Kotlinx_datetimeInstant
        public let endsAt: Kotlinx_datetimeInstant

        var minute: Int {
            let startMinute = Int(startsAt.epochSeconds) / 60
            let endMinute = Int(endsAt.epochSeconds) / 60

            return endMinute - startMinute
        }

        public init(startsAt: Kotlinx_datetimeInstant, endsAt: Kotlinx_datetimeInstant) {
            self.startsAt = startsAt
            self.endsAt = endsAt
        }
    }

    public var id: String {
        items.first?.timetableItem.id.value ?? UUID().uuidString
    }

    public var startsAt: Date
    public var endsAt: Date
    public var minute: Int
    public var items: [TimetableItemWithFavorite]

    public init(duration: Duration, items: [TimetableItemWithFavorite]) {
        self.startsAt = duration.startsAt.toDate()
        self.endsAt = duration.endsAt.toDate()
        self.minute = duration.minute
        self.items = items
    }
}
