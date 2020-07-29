import UIKit

protocol CritterDetailPresenterType: AnyObject, UITableViewDataSource {
    var critterName: String { get }
    var imageURLString: String { get }
}

protocol CritterDetailType: AnyObject {

}

class CritterDetailPresenter: NSObject, CritterDetailPresenterType {

    var model: CritterDetailModelType
    var view: CritterDetailType

    var critterName: String {
        return model.critter.name?.name ?? "Unknown"
    }

    var imageURLString: String {
        return model.critter.imageUrl
    }

    init(model: CritterDetailModelType, view: CritterDetailType) {
        self.model = model
        self.view = view
    }

}

enum CritterDetailSections: String {
    case critterInfo = "Critter Info"
    case availibility = "Availibility"
}

enum BugSections: Int, CaseIterable {
    case price = 0, flickPrice, location, rarity

    var description: String {
        switch self {
            case .price: return "Price"
            case .flickPrice: return "Flick Price"
            case .location: return "Location"
            case .rarity: return "Rarity"
        }
    }
}

enum FishSections: Int, CaseIterable {
    case price = 0, cjPrice, location, rarity, shadow

    var description: String {
        switch self {
            case .price: return "Price"
            case .cjPrice: return "Cj Price"
            case .location: return "Location"
            case .rarity: return "Rarity"
            case .shadow: return "Shadow"
        }
    }
}

enum SeaSections: Int, CaseIterable {
    case price = 0, speed, shadow

    var description: String {
        switch self {
            case .price: return "Price"
            case .speed: return "Speed"
            case .shadow: return "Shadow"
        }
    }
}

extension CritterDetailPresenter {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch model.critter.type {
        case .Bug:
            return BugSections.allCases.count
        case .Fish:
            return FishSections.allCases.count
        case .Sea:
            return SeaSections.allCases.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellID") as? CritterDetailCell else {
            return UITableViewCell()
        }

        switch model.critter.type {
        case .Bug:
            guard let bug = model.critter as? Bug else { break }
            switch indexPath.row {
            case BugSections.price.rawValue:
                cell.configureLabelText(title: "Price", description: "\(bug.price)")
            case BugSections.flickPrice.rawValue:
                cell.configureLabelText(title: "Flick Price", description: "\(bug.priceFlick)")
            case BugSections.location.rawValue:
                cell.configureLabelText(title: "Location", description: bug.availability?.location ?? "Unknown")
            case BugSections.rarity.rawValue:
                cell.configureLabelText(title: "Rarity", description: bug.availability?.rarity ?? "Unknown")
            default:
                return cell
            }
        case .Fish:
            guard let fish = model.critter as? Fish else { break }
            switch indexPath.row {
            case FishSections.price.rawValue:
                cell.configureLabelText(title: "Price", description: "\(fish.price)")
            case FishSections.cjPrice.rawValue:
                cell.configureLabelText(title: "Cj Price", description: "\(fish.priceCj)")
            case FishSections.location.rawValue:
                cell.configureLabelText(title: "Location", description: fish.availability?.location ?? "Unknown")
            case FishSections.rarity.rawValue:
                cell.configureLabelText(title: "Rarity", description: fish.availability?.rarity ?? "Unknown")
            case FishSections.shadow.rawValue:
                cell.configureLabelText(title: "Shadow", description: fish.shadow)
            default:
                return cell
            }
        case .Sea:
            guard let sea = model.critter as? Sea else { break }
            switch indexPath.row {
            case SeaSections.price.rawValue:
                cell.configureLabelText(title: "Price", description: "\(sea.price)")
            case SeaSections.speed.rawValue:
                cell.configureLabelText(title: "Speed", description: sea.speed)
            case SeaSections.shadow.rawValue:
                cell.configureLabelText(title: "Shadow", description: sea.shadow)
            default:
                return cell
            }
        }

        return cell
    }

}
