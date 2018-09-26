//
//  ViewController.swift
//  TableView-2
//
//  Created by Joseph Ward on 18/08/18.
//  Copyright © 2018 Joethermal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Earth","Moon","Mars","Sun","Stars"]
    var filteredItems = [String]()
    var shouldShowSearchResults = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "search by name"
        searchController.searchBar.returnKeyType  = .done
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        //searchBar.isHidden = true
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredItems = items.filter({ (names: String)->Bool in
            return names.lowercased().contains(searchText.lowercased())
            
        })
        if searchText != "" {
            shouldShowSearchResults = true
            tableView.reloadData()
        } else {
            shouldShowSearchResults = false
            tableView.reloadData()
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! DetailViewController
                
                if shouldShowSearchResults {
                    destVC.detailString = filteredItems[indexPath.row]
                    destVC.detailImageString = filteredItems[indexPath.row] + ".png"
                } else {
                    destVC.detailString = items[indexPath.row]
                    destVC.detailImageString = items[indexPath.row] + ".png"
                }
            }
        }
    }

   

}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if shouldShowSearchResults {
            return filteredItems.count
        } else {
        return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if shouldShowSearchResults {
            cell.cellString = filteredItems[indexPath.row]
            cell.imageString = filteredItems[indexPath.row] + ".png"
            return cell
        } else {
            cell.cellString = items[indexPath.row]
            cell.imageString = items[indexPath.row] + ".png"
            return cell
        }
    }
    
    
}
