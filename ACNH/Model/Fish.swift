import Foundation

struct Fish: Codable, Critter {

    let shadow: String
    let priceCj: Int
    var availability: Availability?

    //Critter Protocol
    var id: Int
    var type: Type = .Fish
    var name: Name?
    var price: Int
    var catchPhrase: String
    var museumPhrase: String
    var imageUrl: String
    var iconUrl: String

    private enum CodingKeys: String, CodingKey {
        case id, name, price, shadow, availability
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageUrl = "image_uri"
        case iconUrl = "icon_uri"
    }
}
