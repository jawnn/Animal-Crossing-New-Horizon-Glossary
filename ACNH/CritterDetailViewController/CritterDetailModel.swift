import Foundation

protocol CritterDetailModelType {
    var critter: Critter { get set }
}

class CritterDetailModel: CritterDetailModelType {
    var critter: Critter

    init(critter: Critter) {
        self.critter = critter
    }
}
