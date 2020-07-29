import UIKit

protocol CritterListRouterType {
    func navigateToCritterDetails(critter: Critter)
}

class CritterListRouter: CritterListRouterType {

    var nav: UINavigationController

    init(nav: UINavigationController) {
        self.nav = nav
    }

    func navigateToCritterDetails(critter: Critter) {
        let detailModel = CritterDetailModel(critter: critter)
        let detailVC = CritterDetailViewController()
        let detailPresenter = CritterDetailPresenter(model: detailModel, view: detailVC)
        detailVC.presenter = detailPresenter
        nav.pushViewController(detailVC, animated: true)
    }

}
