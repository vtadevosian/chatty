//
//  Constants.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/23/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

struct K {
    static let appName = "chatty"
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let logSegue = "LogSegue"
    static let chatSegue = "ChatSegue"
    
    struct BrandColors {
        static let shadowColor = "shadowColorb "

        static let bgColor1 = "backgroundColor1"
        static let bgColor2 = "backgroundColor2"
        static let bgColor3 = "backgroundColor3"
        static let bgColor4 = "backgroundColor4"
        
        static let tintColor1 = "tintColor1"
        static let tintColor2 = "tintColor2"
        static let tintColor3 = "tintColor3"
        static let tintColor4 = "tintColor4"
        static let tintColor5 = "tintColor5"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
