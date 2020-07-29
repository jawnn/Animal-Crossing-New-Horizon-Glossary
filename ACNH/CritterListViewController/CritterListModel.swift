import Foundation

protocol CritterListModelType {
    var bugs: [Bug] { get set }
    var fish: [Fish] { get set }
    var sea: [Sea] { get set }
}

class CritterListModel: CritterListModelType {

    var bugs: [Bug]
    var fish: [Fish]
    var sea: [Sea]

    var interactor = CritterInteractor()

    init(bugs: [Bug], fish: [Fish], sea: [Sea]) {
        if let bugs = interactor.fetchBugs() {
            self.bugs = bugs
        } else {
            self.bugs = []
        }
        if let fish = interactor.fetchFish() {
            self.fish = fish
        } else {
            self.fish = []
        }
        if let sea = interactor.fetchSea() {
            self.sea = sea
        } else {
            self.sea = []
        }
    }
}
