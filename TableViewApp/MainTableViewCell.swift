import UIKit

class MainTableViewCell: UITableViewCell {
    
    let artistImageViewWidth: CGFloat = 50
    let artistImageViewHeight: CGFloat = 50
    
    let artistImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let artistNameLabel: UILabel = {
        let nl = UILabel()
        nl.font = .systemFont(ofSize: 18, weight: .medium)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(artistImageView)
        addSubview(artistNameLabel)
        
        [
            artistImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            artistImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            artistImageView.widthAnchor.constraint(equalToConstant: artistImageViewWidth),
            artistImageView.heightAnchor.constraint(equalToConstant: artistImageViewHeight),
            
            artistNameLabel.leftAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: 20),
            artistNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach{ $0.isActive = true}
        
        artistImageView.layer.cornerRadius = 50 / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
