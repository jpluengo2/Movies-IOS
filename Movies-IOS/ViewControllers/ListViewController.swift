//
//  ViewController.swift
//  Movies-IOS
//
//  Created by Mananas on 4/12/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var movies: [Movie] = []
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        //tableView.delegate = self
        
        findMoviesByTitle(query: "last")
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.title = "Movies"
    }
    
    // MARK: Buisness Logic
    
    func findMoviesByTitle(query: String) {
        Task {
            let result = await MovieProvider.findMoviesByTitle(query: query)
            DispatchQueue.main.async {
                self.movies = result
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        let movie = movies[indexPath.row]
        cell.render(with: movie)
        return cell
    }
    
    // MARK: SearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        findMoviesByTitle(query: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        findMoviesByTitle(query: "last")
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMovieDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let movie = movies[indexPath.row]
            detailVC.movie = movie
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

/*extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowMovieDetail", sender: self)
    }
}*/
