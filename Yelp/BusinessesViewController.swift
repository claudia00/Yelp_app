//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    var businesses: [Business]!
    //var searchController = UISearchController!()
    //var filteredData = false
    var data : [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar()

        //configureSearchController()
        //let searchController = UISearchController(searchResultsController: nil)
        //searchController.searchResultsUpdater = self
        //searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
       // searchController.dimsbackgroundDuringPresentation = false
       //searchController.searchBar.sizeToFit()
        //tableView.tableHeaderView = searchController.searchBar
        //definesPresentationContext = true
       // tableView.rowHeight = 110
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        //hidesNavigationBarDuringPresentation = false

        searchDisplayController?.displaysSearchBarInNavigationBar = true
//        searchController.hidesNavigationBarDuringPresentation = false
//
        
        
       tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120
        
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
                self.businesses = businesses
                self.tableView.reloadData()
                if let businesses = businesses {
                    for business in businesses {
                        print(business.name!)
                        print(business.address!)
                    }
                }
            
            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm(term: "Restaurants", sort: .distance, categories: ["asianfusion", "burgers"]) { (businesses, error) in
                self.businesses = businesses
                 for business in self.businesses {
                     print(business.name!)
                     print(business.address!)
                 }
         }
         */
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{

                if businesses != nil{
                 return businesses!.count
            }else{
                return 0
    }
    }
    //        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath){
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
}
/*
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // When there is no text, filteredData is the same as the original data
    // When user has entered text into the search box
    // Use the filter method to iterate over all items in the data array
    // For each item, return true if the item should be included and false if the
    // item should NOT be included
    filteredData = searchText.isEmpty ? false: true
    filteredData = searchText.isEmpty ? data : data.filter { ($0).name!.lowercased().contains(searchBar.text!.lowercased())
    }
    
    tableView.reloadData()
}*/
/*func updateSearchResultsForSearchController(searchController: UISearchController) {
    if let searchText = searchController.searchBar.text {
        business = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            return dataString.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
        })
        
        tableView.reloadData()
}
}*/
//func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//    business = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
//        // If dataItem matches the searchText, return true to include it
//        return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil


//func getData()
//{
//
//    //insert member data within data array
//    data.addObject(member)
//}

/*
func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchActive = true
}

func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchActive = false
}

func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    searchActive = false;
    
    searchBar.text = nil
    searchBar.resignFirstResponder()
    tableView.resignFirstResponder()
    self.searchBar.showsCancelButton = false
    tableView.reloadData()
}
*/

   // func searchBarIsEmpty() ->Bool{
   //     return searchController.searchBar.text?.isEmpty ?? true
   // }
   //func filerContentForSearchText(_ searchText: String, scope)
    /*func configureSearchController(){
      searchController = UISearchController(searchResultsController: nil)
      searchController.searchResultsUpdater = self
      searchController.dimsBackgroundDuringPresentation = false
      searchController.searchBar.placeholder = "Search here.."
      searchController.searchBar.delegate = self
      searchController.searchBar.sizeToFit()
        tableView.reloadData = searchController.searchBar
        //.tableheaderView
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
        shouldShowSearchResults = true
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        if !shouldShowSearchResults {
        shouldShowSearchResults = false
        tableView.reloadData()
    }
    searchController.searchBar.resignFirstResponder()

    //func updateSearchResultsForSearchController(searchController:UISearchController){*/
        
    
    
//    navigationItem.titleView = searchController.searchBar
//    searchDisplayController?.displaysSearchBarInNavigationBar = true
//    searchController.hidesNavigationBarDuringPresentation = false
//


