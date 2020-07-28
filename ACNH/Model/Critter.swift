import Foundation

enum Type: String {
    case Bug, Fish, Sea
}

protocol Critter {
    var id: Int { get set }
    var type: Type { get set }
    var name: Name? { get set }
    var price: Int { get set }
    var catchPhrase: String { get set }
    var museumPhrase: String { get set }
    var imageUrl: String { get set }
    var iconUrl: String { get set }
}

struct Name: Codable {
    let name: String

    private enum CodingKeys: String, CodingKey {
        case name = "name-USen"
    }
}

struct Availability: Codable {
    let monthsAvailableInNorth: String
    let monthsAvailableInSouth: String
    let time: String
    let isAllDay: Bool
    let isAllYear: Bool
    let location: String
    let rarity: String

    private enum CodingKeys: String, CodingKey {
        case monthsAvailableInNorth = "month-northern"
        case monthsAvailableInSouth = "month-southern"
        case time, isAllDay, isAllYear, location, rarity
    }
}

struct SeaAvailability: Codable {
    let monthsAvailableInNorth: String
    let monthsAvailableInSouth: String
    let time: String
    let isAllDay: Bool
    let isAllYear: Bool

    private enum CodingKeys: String, CodingKey {
        case monthsAvailableInNorth = "month-northern"
        case monthsAvailableInSouth = "month-southern"
        case time, isAllDay, isAllYear
    }
}
