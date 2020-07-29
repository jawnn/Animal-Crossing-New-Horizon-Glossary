import UIKit

protocol CritterListPresenterType: AnyObject, UITableViewDataSource {
    var bugs: [Bug] { get }
    var fish: [Fish] { get }
    var sea: [Sea] { get }
}

protocol CritterListType: AnyObject {
    var critterSection: Int { get }
}

class CritterListPresenter: NSObject, CritterListPresenterType {

    var model: CritterListModelType
    var view: CritterListType

    var bugs: [Bug] {
        return model.bugs
    }

    var fish: [Fish] {
        return model.fish
    }

    var sea: [Sea] {
        return model.sea
    }

    init(model: CritterListModelType, view: CritterListType) {
        self.model = model
        self.view = view
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch view.critterSection {
        case 0:
            return model.bugs.count
        case 1:
            return model.fish.count
        case 2:
            return model.sea.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.critterListCell.identifier) as? CritterListCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        switch view.critterSection {
        case 0:
            cell.configure(critter: bugs[index])
        case 1:
            cell.configure(critter: fish[index])
        case 2:
            cell.configure(critter: sea[index])
        default:
            return UITableViewCell()
        }

        return cell
    }
}
