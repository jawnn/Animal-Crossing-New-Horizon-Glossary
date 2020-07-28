import Foundation

struct Bug: Codable, Critter {

    let priceFlick: Int
    var availability: Availability?

    // Critter Protocol
    var id: Int
    var type: Type = .Bug
    var name: Name?
    var price: Int
    var catchPhrase: String
    var museumPhrase: String
    var imageUrl: String
    var iconUrl: String

    private enum CodingKeys: String, CodingKey {
        case id, name, price, availability
        case priceFlick = "price-flick"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageUrl = "image_uri"
        case iconUrl = "icon_uri"
    }
}
