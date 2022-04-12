//
//  SBUHighlightInfo.swift
//  SendbirdUIKit
//
//  Created by Hoon Sung on 2021/02/15.
//  Copyright © 2021 Sendbird, Inc. All rights reserved.
//

import Foundation
import SendBirdSDK


public class SBUHighlightMessageInfo {
    
    public let messageId: Int64
    public let updatedAt: Int64
    
    public init(messageId: Int64, updatedAt: Int64) {
        self.messageId = messageId
        self.updatedAt = updatedAt
    }
}
