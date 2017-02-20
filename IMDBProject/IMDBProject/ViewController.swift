//
//  ViewController.swift
//  IMDBProject
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    private var mySearchBar: UISearchBar!
    private var myLabel : UILabel!
    
    var baseUrl = "https://api.themoviedb.org/3/movie/"
    var basePhotoUrl = "https://image.tmdb.org/t/p/w500"
    var apiKey = "3a4bf77e064186e7170196ff7fb1519e"
    var movieStart = 100
    var movieEnd = 996
    var apiURL = "?api_key=3a4bf77e064186e7170196ff7fb1519e"
    var appendixURL = "&language=en-US"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make UISearchBar instance
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
        
//        // add shadow
//        mySearchBar.layer.shadowColor = UIColor.black.cgColor
//        mySearchBar.layer.shadowOpacity = 0.5
//        mySearchBar.layer.masksToBounds = false
        
        // hide cancel button
        mySearchBar.showsCancelButton = true
        
        // hide bookmark button
        mySearchBar.showsBookmarkButton = false
        
        // set Default bar status.
        mySearchBar.searchBarStyle = UISearchBarStyle.default
        
        // set title
        mySearchBar.prompt = "Title"
        
        // set placeholder
        mySearchBar.placeholder = "Input text"
        
        // change the color of cursol and cancel button.
        mySearchBar.tintColor = UIColor.red
        
        // hide the search result.
        mySearchBar.showsSearchResultsButton = false
        
        // add searchBar to the view.
        self.view.addSubview(mySearchBar)
        
        // make UITextField
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        myLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myLabel.text = ""
        myLabel.layer.borderWidth = 1.0
        myLabel.layer.borderColor = UIColor.gray.cgColor
        myLabel.layer.cornerRadius = 10.0
        
        // add the label to the view.
        self.view.addSubview(myLabel)
        self.navigationController?.navigationBar.addSubview(myLabel)
        
        for i in 100...140 {
            var url = baseUrl + String(i) + apiURL + appendixURL
            let otherURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            
            let task2 = URLSession.shared.dataTask(with: otherURL!, completionHandler: { (data, response, error) -> Void in
                
                if let data = data {
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            
                            OperationQueue.main.addOperation({ ()
                                if let backdrop_path = jsonResult["backdrop_path"] {
                                    //print(backdrop_path)
                                    var imagePath = self.basePhotoUrl + String(describing: backdrop_path)
                                    print("image path is: " + imagePath)
                                }
                                if let overview = jsonResult["overview"] {
                                    //print(overview)
                                }
                                if let poster_path = jsonResult["poster_path"] {
                                    //print(poster_path)
                                }
                                if let title = jsonResult["title"] {
                                    //print(title)
                                }
                            })
                            
                        }
                    }
                    catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }
                else if let error = error {
                    print(error.localizedDescription)
                }
            })
            task2.resume()
        }
    }
    
    // called whenever text is changed.
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        myLabel.text = searchText
    }
    
    // called when cancel button is clicked
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        myLabel.text = ""
        mySearchBar.text = ""
    }
    
    // called when search button is clicked
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        myLabel.text = "Searching"
        mySearchBar.text = ""
        self.view.endEditing(true)
    }
}
