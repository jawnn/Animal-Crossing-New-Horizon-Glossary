import UIKit
import Rswift

class ViewController: UIViewController {


    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var tableView: UITableView!

    var sea = [Sea]()
    var fish = [Fish]()
    var bugs = [Bug]()

    let decoder = JSONDecoder()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"

        title = formatter.string(from: date)

        segmentController.addTarget(self, action: #selector(selectDifferentSection), for: .valueChanged)

        fetchBugs()
        fetchSea()
        fetchFish()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CritterListCell.self), bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.critterListCell.identifier)
    }

    @objc func selectDifferentSection() {
        tableView.reloadData()
    }

    private func fetchSea() {
        let urlString = "https://acnhapi.com/v1a/sea"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonSea = try? decoder.decode([Sea].self, from: data) {
                    sea = jsonSea
                    tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
                }
            }
        }
    }

    private func fetchFish() {
        let urlString = "https://acnhapi.com/v1a/fish"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonFish = try? decoder.decode([Fish].self, from: data) {
                    fish = jsonFish
                    tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
                }
            }
        }
    }

    private func fetchBugs() {
        let urlString = "https://acnhapi.com/v1a/bugs"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonBugs = try? decoder.decode([Bug].self, from: data) {
                    bugs = jsonBugs
                    tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentController.selectedSegmentIndex {
        case 0:
            return bugs.count
        case 1:
            return fish.count
        case 2:
            return sea.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.critterListCell.identifier) as? CritterListCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        switch segmentController.selectedSegmentIndex {
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var critter : Critter {
            switch segmentController.selectedSegmentIndex {
            case 0:
                return bugs[indexPath.row]
            case 1:
                return fish[indexPath.row]
            case 2:
                return sea[indexPath.row]
            default:
                return bugs[indexPath.row]
            }
        }
        let detailsVC = CritterDetailViewController(type: critter.type, critter: critter)
        navigationController?.pushViewController(detailsVC, animated: false)
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
