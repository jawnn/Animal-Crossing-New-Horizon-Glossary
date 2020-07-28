import Foundation

struct Bug: Codable, Critter {
    var id: Int
    var name: Name?
    var price: Int
    var availability: Availability?
    var catchPhrase: String
    var museumPhrase: String
    var imageUrl: String
    var iconUrl: String
    let priceFlick: Int

    private enum CodingKeys: String, CodingKey {
        case id, name, price, availability
        case priceFlick = "price-flick"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageUrl = "image_uri"
        case iconUrl = "icon_uri"
    }
}
