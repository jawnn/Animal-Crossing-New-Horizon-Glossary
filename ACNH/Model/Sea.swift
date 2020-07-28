import Foundation

struct Sea: Codable, Critter {

    let speed: String
    let shadow: String

    // Critter Protocol 
    var id: Int
    var name: Name?
    var price: Int
    var availability: Availability?
    var catchPhrase: String
    var museumPhrase: String
    var imageUrl: String
    var iconUrl: String

    private enum CodingKeys: String, CodingKey {
        case id, name, price, speed, shadow, availability
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageUrl = "image_uri"
        case iconUrl = "icon_uri"
    }
}
