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
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        findMoviesByTitle(query: "last")
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    // MARK: Buisness Logic
    
    func findMoviesByTitle(query: String) {
        Task {
            movies = await MovieProvider.findMoviesByTitle(query: query)
            DispatchQueue.main.async {
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
    
    /*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let recipe = recipes[indexPath.row]
        detailViewController.recipe = recipe
        tableView.deselectRow(at: indexPath, animated: true)
    }
    */
    
}
