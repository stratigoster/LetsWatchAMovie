//
//  ViewController.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var baseUrl = "https://api.themoviedb.org/3/movie/"
    
    var apiKey = "3a4bf77e064186e7170196ff7fb1519e"
    var movieStart = 100
    var movieEnd = 996
    var apiURL = "?api_key=3a4bf77e064186e7170196ff7fb1519e"
    var appendixURL = "&language=en-US"
    
    var videos: [Video] = []
    let blackView = UIView()
    
    @IBOutlet weak var collectionView: UICollectionView!
    var persons: [Person]?
    
    @IBOutlet weak var moreButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let settingsLauncher = SettingLauncher()
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        settingsLauncher.showSettings()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt  indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PersonCell
        
        cell.video = videos[indexPath.item]
        return cell
    }
    
   
    
    func fetchMovieURL() {
        
        self.videos = [Video]()
        
        for i in 100...140 {
            let url = baseUrl + String(i) + apiURL + appendixURL
            let updateUrl = NSURL(string: url)
            print("updateUrl: ")
            print(updateUrl?.absoluteString)
            URLSession.shared.dataTask(with: updateUrl as! URL) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    
                    let dict = json as? NSDictionary
                    
                    //for (key, val) in dict! {
                        //print("key: ")
                        //print("\(key)")
                        //print("value:")
                        //print("\(val)")
                    //}
                    
                    let video = Video()
                    
                    if let videoContent = dict?["releaseDate"] as? String? {
                        video.content = videoContent
                    }
                    
                    if let otherImagePath = dict?["backdrop_path"] as? String? {
                        video.otherImageName = otherImagePath
                    }
                    
                    if let thumbnailImageName = dict?["poster_path"] as? String? {
                        video.thumbnailImageName = thumbnailImageName
                    }
                    
                    if let title = dict?["title"] as? String?{
                        video.title = title
                    }
                    
                    self.videos.append(video)
                    
                    DispatchQueue.main.async(execute: {
                       self.collectionView?.reloadData()
                    })
                   
                } catch let jsonError {
                    print(jsonError)
                }
            }.resume()
        }
    }
    
    /*
    func demoData() {
        
        let person1: Person = Person(name: "Batman", portraitImageName: "ger", flagImageName: "batman")
        let person2: Person = Person(name: "MissedCall", portraitImageName: "us", flagImageName: "missedCall")
        let person3: Person = Person(name: "SilentScream", portraitImageName: "gb", flagImageName: "silentScream")
        let person4: Person = Person(name: "TheWatch", portraitImageName: "rus", flagImageName: "theWatch")
        
        let person11: Person = Person(name: "Batman", portraitImageName: "ger", flagImageName: "batman")
        let person12: Person = Person(name: "MissedCall", portraitImageName: "us", flagImageName: "missedCall")
        let person13: Person = Person(name: "SilentScream", portraitImageName: "gb", flagImageName: "silentScream")
        let person14: Person = Person(name: "TheWatch", portraitImageName: "rus", flagImageName: "theWatch")
        
        let person21: Person = Person(name: "Batman", portraitImageName: "ger", flagImageName: "batman")
        let person22: Person = Person(name: "MissedCall", portraitImageName: "us", flagImageName: "missedCall")
        let person23: Person = Person(name: "SilentScream", portraitImageName: "gb", flagImageName: "silentScream")
        let person24: Person = Person(name: "TheWatch", portraitImageName: "rus", flagImageName: "theWatch")
        
        let person31: Person = Person(name: "Batman", portraitImageName: "ger", flagImageName: "batman")
        let person32: Person = Person(name: "MissedCall", portraitImageName: "us", flagImageName: "missedCall")
        let person33: Person = Person(name: "SilentScream", portraitImageName: "gb", flagImageName: "silentScream")
        let person34: Person = Person(name: "TheWatch", portraitImageName: "rus", flagImageName: "theWatch")
        
        self.persons = [person1, person2, person3, person4, person11, person12, person13, person14, person21, person22, person23, person24, person31, person32, person33, person34]
    }
    */
    
    func handleMore() {
        settingsLauncher.showSettings()
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.demoData()
        fetchMovieURL()
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     if persons != nil {
     return persons!.count
     }
     else {
     return 0
     }
     }
     */
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     super.prepare(for: segue, sender: sender)
     
     if segue.identifier == "toDetailView" {
        let detailVC: DetailViewController? = segue.destination as? DetailViewController
        if detailVC != nil {
            let item: Video = self.videos[self.collectionView.indexPathsForSelectedItems![0].row]
            detailVC!.title = item.content
            detailVC!.imageName = item.otherImageName
        }
     }
     }
     */
    
    /*
     for (key, val) in dict! {
     print("\(key): \(val)")
     }
     */
    
    //video.content = dict?["overview"] as! String!
    
    /*
     print(dict?["overview"])
     print(dict?["backdrop_path"])
     print(dict?["poster_path"])
     print(dict?["original_title"])
     */
    
    //print(dict?["overview"] as! String?)
    
    //let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    //print(str as Any)

}

