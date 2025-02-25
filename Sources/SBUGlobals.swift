//
//  SBUGlobals.swift
//  SendbirdUIKit
//
//  Created by Tez Park on 27/02/2020.
//  Copyright © 2020 Sendbird, Inc. All rights reserved.
//

import UIKit
import Photos

public class SBUGlobals {
    
    /// The application ID from Sendbird dashboard.
    /// - Since: 3.0.0
    public static var applicationId: String?
    
    /// The access token of the user
    /// - Since: 3.0.0
    public static var accessToken: String?
    
    /// The current user that is type of `SBUUser`
    /// - Since: 3.0.0
    public static var currentUser: SBUUser?
    
    // MARK: - Channel List
    /// If this value is enabled, the channel list shows the typing indicator. The defaut value is `false`.
    /// - Since: 3.0.0
    public static var isChannelListTypingIndicatorEnabled: Bool = false
    
    /// If this value is enabled, the channel list provides receipt state of the sent message. The defaut value is `false`.
    /// - Since: 3.0.0
    public static var isChannelListMessageReceiptStateEnabled: Bool = false
    

    // MARK: - Message Grouping
    
    /// If this value is enabled, messages sent at similar times are grouped.
    /// - Since: 3.0.0
    public static var isMessageGroupingEnabled: Bool = true
    
    
    // MARK: - Reply Type
    
    /// If this value is not `.none`, replying features will be activated. The default value is `.none`
    /// - Since: 3.0.0
    public static var replyType: SBUReplyType = .none
    
    
    // MARK: - PHPickerViewController
    
    /// If it's `true`, uses `PHPickerViewController` instead of `UIImagePickerController` when access to the photo library for sending file message.
    /// - Since: 3.0.0
    @available(iOS 14, *)
    public static var isPHPickerEnabled: Bool = false
    
    /// The level of access to the photo library. The default value is `.readWrite`.
    /// - Since: 2.2.4
    @available(iOS 14, *)
    public static var photoLibraryAccessLevel: SBUPhotoAccessLevel = .readWrite

    
    // MARK: - User Profile
    /// If this value is enabled, when you click on a user image, the user profile screen is displayed.
    /// - Since: 3.0.0
    public static var isUserProfileEnabled: Bool = false

    /// If this value is enabled, when you click on a user image in open channel, the user profile screen is displayed.
    /// - Since: 3.0.0
    public static var isOpenChannelUserProfileEnabled: Bool = false

    /// if this value is enabled, image compression and resizing will be applied when sending a file message
    /// - Since: 3.0.0
    public static var isImageCompressionEnabled: Bool = false
    
    /// Image compression rate value that will be used when sending image. Default value is 0.85.
    /// Typically this value will be used in `jpegData(compressionQuality:)`
    /// - Since: 2.0.0
    public static var imageCompressionRate: CGFloat = 0.25
    
    /// Image resizing size value that will be used when sending image. Default value is a device screen size.
    /// - Since: 2.0.0
    public static var imageResizingSize: CGSize = UIScreen.main.bounds.size;
    
    /// The configuration for user mention.
    /// - NOTE: If `userMentionConfig` is set to `SBUUserMentionConfiguration` instance, user mention feature is enabled.
    /// - NOTE: If `userMentionConfig` is set to `nil` instance, user mention feature is disabled.
    /// - Since: 3.0.0
    public static var userMentionConfig: SBUUserMentionConfiguration?
    
    /// The boolean value that indicates whether the user mention feature is enabled or not.
    /// - NOTE: If set to `true`, it sets `userMentionConfig` to default value when it was `nil`.
    /// - Since: 3.0.0
    public static var isUserMentionEnabled: Bool {
        get { SBUGlobals.userMentionConfig != nil }
        set {
            switch newValue {
            case true:
                if userMentionConfig == nil {
                    SBUGlobals.userMentionConfig = .init()
                }
            case false:
                SBUGlobals.userMentionConfig = nil
            }
        }
    }
}
