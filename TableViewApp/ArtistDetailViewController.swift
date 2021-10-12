import UIKit

class ArtistDetailViewController: UIViewController {
    
    var artist: Artist? {
        didSet{
            artistImageView.image = artist?.image
            artistNameLabel.text = artist?.name
            artistDebutYearLabel.text = artist?.debutYear
        }
    }
    
    let artistImageView: UIImageView = {
       let ImageView = UIImageView()
        ImageView.layer.cornerRadius = 10
        ImageView.clipsToBounds = true
        ImageView.contentMode = .scaleAspectFill
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return ImageView
    }()
    
    let artistNameLabel: UILabel = {
        let Label = UILabel()
        Label.font = .boldSystemFont(ofSize: 30)
        Label.textColor = .brown
        Label.translatesAutoresizingMaskIntoConstraints = false
        
        return Label
    }()
    
    let debutYearLabel: UILabel = {
       let Label = UILabel()
        Label.font = .boldSystemFont(ofSize: 30)
        Label.textColor = .black
        Label.text = "DebutYear:"
        
        return Label
    }()
    
    let artistDebutYearLabel: UILabel = {
       let Label = UILabel()
        Label.font = .boldSystemFont(ofSize: 40)
        Label.textColor = .black
        Label.textAlignment = .right
        
        return Label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(artistImageView)
        view.addSubview(artistNameLabel)
        [
            artistImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            artistImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            artistImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            artistImageView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            artistNameLabel.rightAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: -15),
            artistNameLabel.bottomAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: -15)
        ].forEach{ $0.isActive = true }
        
        let debutYearStackView = UIStackView(arrangedSubviews:[debutYearLabel, artistDebutYearLabel])
        debutYearStackView.axis = .horizontal
        debutYearStackView.spacing = 0
        debutYearStackView.distribution = .fillEqually
        debutYearStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(debutYearStackView)
        [
            debutYearStackView.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 60),
            debutYearStackView.leftAnchor.constraint(equalTo: artistImageView.leftAnchor, constant: 10),
            debutYearStackView.rightAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: -10)
        ].forEach{ $0.isActive = true }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Detail"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
