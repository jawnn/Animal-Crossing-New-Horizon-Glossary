import Kingfisher
import UIKit

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

class CritterDetailViewController: UIViewController {

    @IBOutlet var critterImage: UIImageView!
    @IBOutlet var tableView: UITableView!

    let type: Type
    var critter: Critter

    init(type: Type, critter: Critter) {
        self.type = type
        self.critter = critter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: critter.imageUrl) {
            critterImage.kf.setImage(with: url)
        }

        title = critter.name?.name.capitalized

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CritterDetailCell.self), bundle: nil), forCellReuseIdentifier: "detailCellID")


        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapBack))

    }

    @objc func didTapBack() {
        navigationController?.popViewController(animated: false)
    }

}

extension CritterDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
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

        switch type {
        case .Bug:
            guard let bug = critter as? Bug else { break }
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
            guard let fish = critter as? Fish else { break }
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
            guard let sea = critter as? Sea else { break }
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
