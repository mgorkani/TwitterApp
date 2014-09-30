//
//  UpdateTweetsProtocol.swift
//  TwitterApp
//
//  Created by Monika Gorkani on 9/29/14.
//  Copyright (c) 2014 Monika Gorkani. All rights reserved.
//

import Foundation
protocol UpdateTweetsProtocol
{
    func makeFavoriteTweet(tweet:Tweet)
    func retweet(tweet:Tweet)
    func replyTweet(tweet:Tweet, status:String)
    func postTweet(status:String)
}

