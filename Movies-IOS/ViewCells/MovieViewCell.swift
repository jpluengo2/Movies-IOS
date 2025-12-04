//
//  RecipeViewCell.swift
//  Movies-IOS
//
//  Created by Mananas on 4/12/25.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(with movie: Movie) {
        titleLabel.text = movie.Title
        yearLabel.text = "\(movie.Year)"
        posterView.loadFrom(url: movie.Poster)
    }

}
