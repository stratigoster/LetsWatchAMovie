//
//  ViewController.swift
//  WebMovieConnection
//
//  Created by xszhao on 2017-02-18.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var baseUrl = "https://api.themoviedb.org/3/movie/"
    var basePhotoUrl = "https://image.tmdb.org/t/p/w500"
    var apiKey = "3a4bf77e064186e7170196ff7fb1519e"
    var movieStart = 100
    var movieEnd = 996
    var apiURL = "?api_key=3a4bf77e064186e7170196ff7fb1519e"
    var appendixURL = "&language=en-US"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

