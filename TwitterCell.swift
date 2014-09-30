//
//  TwitterCell.swift
//  TwitterApp
//
//  Created by Monika Gorkani on 9/29/14.
//  Copyright (c) 2014 Monika Gorkani. All rights reserved.
//

import UIKit

class TwitterCell: UITableViewCell {
    
    var delegate:UpdateTweetsProtocol?
    var tweet = Tweet(dictionary: [:])
    
    @IBOutlet weak var retweetImage: UIImageView!
    @IBOutlet weak var retweeterLabel: UILabel!
   
    @IBAction func makeFavorite(sender: AnyObject) {
        if (!tweet.favorited!) {
            self.delegate!.makeFavoriteTweet(tweet)
            
        }
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.favoriteButton.highlighted = true
        }
        
    }
  
        
    
    @IBAction func retweet(sender: AnyObject) {
       
        if (!tweet.retweeted!) {
            self.delegate!.retweet(tweet)
           
        }
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.retweetButton.highlighted = true
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var timeAgo: UILabel!
    func setTweet(tweet:Tweet) {
        self.tweet = tweet
        tweetText.text = tweet.text
        twitterName.text = tweet.user!.name
        profileView.setImageWithURL(NSURL(string:tweet.user!.profileImageUrl!))
        twitterHandle.text = "@\(tweet.user!.screenname!)"
        timeAgo.text = tweet.createdAt!.timeAgo()
        
        if (tweet.favorited!) {
            favoriteButton.highlighted = true
        }
        if (tweet.retweeted!) {
            retweetButton.highlighted = true
        }
        if (tweet.retweetCount! == 0 || tweet.retweeter == nil) {
            retweeterLabel.text = ""
            retweetImage.hidden = true
        }
        else {
            retweeterLabel.text = "\(tweet.retweeter!.name!) retweeted"
            retweetImage.hidden = false
        }
        
    }
    
    
    @IBOutlet weak var twitterName: UILabel!
    @IBOutlet weak var twitterHandle: UILabel!

    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
}
