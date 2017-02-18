//
//  ViewController.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        if persons != nil {
            return persons!.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt  indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PersonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath as IndexPath) as! PersonCell
        
        let currentPerson: Person = self.persons![indexPath.row]
        cell.flagImageView.image = UIImage(named: currentPerson.flagImageName)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            if detailVC != nil {
                let item: Person = self.persons![self.collectionView.indexPathsForSelectedItems![0].row]
                detailVC!.title = item.name
                detailVC!.imageName = item.portraitImageName
                
            }
        }
    }
    
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
        self.demoData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

