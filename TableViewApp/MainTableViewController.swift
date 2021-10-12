import UIKit

class Artist {
    
    let name: String
    let debutYear: String
    let image: UIImage
    
    init(name: String, debutYear:String, image: UIImage) {
        self.name = name
        self.debutYear = debutYear
        self.image = image
    }
}

class MainTableViewController: UITableViewController {
    
    private let cellId = "cellId"
    private let artists: [[Artist]] = [
        //  1960s
        [
            .init(name: "The Beatles", debutYear: "1960年", image:#imageLiteral(resourceName: "The Beatles")),
            .init(name: "The Rolling Stones", debutYear: "1962年",  image: #imageLiteral(resourceName: "The Rolling Stones")),
            .init(name: "Cream", debutYear: "1966年",  image: #imageLiteral(resourceName: "Cream")),
            .init(name: "The Jimi Hendrix Experience", debutYear: "1966年", image: #imageLiteral(resourceName: "The Jimi Hendrix Experience")),
            .init(name: "Led Zeppelin", debutYear: "1968年",  image: #imageLiteral(resourceName: "Led Zeppelin"))
        ],
        //  1970s
        [
            .init(name: "Aerosmith", debutYear: "1973年",  image: #imageLiteral(resourceName: "Aerosmith")),
            .init(name: "AC/DC", debutYear: "1973年",  image: #imageLiteral(resourceName: "ACDC")),
            .init(name: "Queen", debutYear: "1973年",  image: #imageLiteral(resourceName: "Queen")),
            .init(name: "Sex Pistols", debutYear: "1975年",  image: #imageLiteral(resourceName: "Sex Pistols")),
            .init(name: "The Clash", debutYear: "1976年",  image: #imageLiteral(resourceName: "The Clash"))
        ],
        //  1980s
        [
            .init(name: "Red Hot Chili Peppers", debutYear: "1983年",  image: #imageLiteral(resourceName: "Red Hot Chili Peppers")),
            .init(name: "Metallica", debutYear: "1983年",  image: #imageLiteral(resourceName: "Metallica")),
            .init(name: "Radiohead", debutYear: "1985年",  image: #imageLiteral(resourceName: "Radiohead")),
            .init(name: "NIRVANA", debutYear: "1987年",  image: #imageLiteral(resourceName: "NIRVANA")),
            .init(name: "Green Day", debutYear: "1987年",  image: #imageLiteral(resourceName: "Green Day"))
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Artists Debut Year"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
}

// MARK: - tableViewの設定
extension MainTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return artists.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .brown
        label.textColor = .white

        switch section {
        case 0:
            label.text = "1960s"
        case 1:
            label.text = "1970s"
        case 2:
            label.text = "1980s"
        default:
            break
        }

        return label
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MainTableViewCell
        let artist = artists[indexPath.section][indexPath.row]
        cell.artistNameLabel.text = artist.name
        cell.artistImageView.image = artist.image

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ArtistDetailViewController()
        viewController.artist = artists[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
