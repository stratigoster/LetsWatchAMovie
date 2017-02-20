//
//  CollectionViewCell.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PersonCell: UICollectionViewCell
{
    
    /*
    var video: Video? {
        titleLabel.text = video?.title
        setupThumbnailImage()
        setupProfileImage()
    }
    */
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            setupThumbnailImage()
            setupProfileImage()
            setupViews()
        }
    }
    
    func loadImageUsingUrlString(_ urlString: String) {
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                //let imageToCache = UIImage(data: data!)
                
                //print(imageToCache?.description)
                //if self.imageUrlString == urlString {
                
                self.thumbnailImageView.image = UIImage(data: data!)
                //}
                
                //imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            })
            
        }).resume()
    }

        /*
        didSet {
            print(video)
            print(video?.otherImageName as Any)
            setupThumbnailImage(url: (video?.otherImageName)!)
        }
        */
 
    //@IBOutlet var textView: UITextView!
    
   // @IBOutlet var thumbnailImageView: UIImageView!
    
    //func setupThumbnailImage(url: String ) {
        
        //if let thumbnailImageUrl = video?.thumbnailImageName {
        //setupThumbnailImage(url: url)
        //}
    //}
    
    var basePhotoUrl = "https://image.tmdb.org/t/p/w500"
    
    /*
    func setupThumbnailImage(url: String) {
        
        let urlEnd = "/mZ3NbiL34YPEesmrMQuYQusTCqo.jpg"
        
        let photoRetreival = basePhotoUrl + urlEnd
        print(photoRetreival)
        
        //if let thumbnailImageUrl = videos.thumbnailImageName {
        
        let url = NSURL(string: photoRetreival)
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            if error != nil {
                //print(error)
                return
            }
            DispatchQueue.main.async(execute: {
                self.thumbnailImageView.image = UIImage(data: data!)
            })
        }).resume()
    }
    */
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            let urlEnd = "/mZ3NbiL34YPEesmrMQuYQusTCqo.jpg"
            let photoRetreival = basePhotoUrl + urlEnd
            print("setupProfileImage")
            print(photoRetreival)
            loadImageUsingUrlString(photoRetreival)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            let urlEnd = "/mZ3NbiL34YPEesmrMQuYQusTCqo.jpg"
            let photoRetreival = basePhotoUrl + urlEnd
            print("setupThumbnailImage")
            print(photoRetreival)
            loadImageUsingUrlString(photoRetreival)
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "rus")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "rus")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
     func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //height constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
}
