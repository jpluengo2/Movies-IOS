//
//  DetailViewController.swift
//  Movies-IOS
//
//  Created by Mananas on 4/12/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets (conéctalos en el Storyboard)
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    // MARK: - Properties
    var movie: Movie?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    // MARK: - UI
    private func render() {
        guard let movie else { return }
        title = movie.Title
        
        titleLabel.text = movie.Title
        yearLabel.text = movie.Year
        directorLabel.text = movie.Director
        genreLabel.text = movie.Genre
        runtimeLabel.text = movie.Runtime
        plotTextView.text = movie.Plot
        
        posterImageView.loadFrom(url: movie.Poster)
    }
}
