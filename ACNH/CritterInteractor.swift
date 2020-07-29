import UIKit

protocol CritterService {
    func fetchBugs() -> [Bug]?
    func fetchFish() -> [Fish]?
    func fetchSea() -> [Sea]?
}

class CritterInteractor: CritterService {

    let decoder = JSONDecoder()

    func fetchSea() -> [Sea]? {
        let urlString = "https://acnhapi.com/v1a/sea"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonSea = try? decoder.decode([Sea].self, from: data) {
                    return jsonSea
                }
            }
        }
        return nil
    }

    func fetchFish() -> [Fish]? {
        let urlString = "https://acnhapi.com/v1a/fish"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonFish = try? decoder.decode([Fish].self, from: data) {
                    return jsonFish
                }
            }
        }
        return nil
    }

    func fetchBugs() -> [Bug]? {
        let urlString = "https://acnhapi.com/v1a/bugs"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonBugs = try? decoder.decode([Bug].self, from: data) {
                    return jsonBugs
                }
            }
        }
        return nil
    }
}
