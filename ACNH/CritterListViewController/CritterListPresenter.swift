import UIKit

protocol CritterListPresenterType: AnyObject, UITableViewDataSource {
    func getTappedCritter(index: Int) -> Critter
}

protocol CritterListType: AnyObject {
    var critterSection: Int { get }
}

class CritterListPresenter: NSObject, CritterListPresenterType {

    var model: CritterListModelType
    var view: CritterListType

    init(model: CritterListModelType, view: CritterListType) {
        self.model = model
        self.view = view
    }

    func getTappedCritter(index: Int) -> Critter {
        var critter : Critter {
            switch view.critterSection {
            case 0:
                return model.bugs[index]
            case 1:
                return model.fish[index]
            case 2:
                return model.sea[index]
            default:
                return model.bugs[index]
            }
        }
        return critter
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
            cell.configure(critter: model.bugs[index])
        case 1:
            cell.configure(critter: model.fish[index])
        case 2:
            cell.configure(critter: model.sea[index])
        default:
            return UITableViewCell()
        }

        return cell
    }
}
