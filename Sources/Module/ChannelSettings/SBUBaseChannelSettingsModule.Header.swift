//
//  SBUBaseChannelSettingsModule.Header.swift
//  SendbirdUIKit
//
//  Created by Tez Park on 2021/09/30.
//  Copyright © 2021 Sendbird, Inc. All rights reserved.
//

import UIKit
import SendbirdChatSDK


/// Event methods for the views updates and performing actions from the header component in channel settings module.
public protocol SBUBaseChannelSettingsModuleHeaderDelegate: SBUCommonDelegate { }


/// Methods to get data source for header component in a channel setting.
public protocol SBUBaseChannelSettingsModuleHeaderDataSource: AnyObject { }


extension SBUBaseChannelSettingsModule {
    
    /// A module component that represent the header of `SBUBaseChannelSettingsModule`.
    @objcMembers open class Header: UIView {
        
        // MARK: - UI properties (Public)
        
        /// A view that represents a title in navigation bar.
        /// - NOTE: When the value is updated, `didUpdateTitleView`is called.
        public var titleView: UIView? = nil {
            didSet { self.didUpdateTitleView() }
        }
        /// A view that represents a left `UIBarButtonItem` in navigation bar.
        /// - NOTE: When the value is updated, `didUpdateLeftItem`is called.
        public var leftBarButton: UIBarButtonItem? = nil {
            didSet { self.didUpdateLeftItem() }
        }
        
        /// A view that represents a right `UIBarButtonItem` in navigation bar.
        /// - NOTE: When the value is updated, `didUpdateRightItem`is called.
        public var rightBarButton: UIBarButtonItem? = nil {
            didSet { self.didUpdateRightItem() }
        }

        /// The object that is used as the theme of the header component. The theme must adopt the `SBUChannelSettingsTheme` class.
        public var theme: SBUChannelSettingsTheme? = nil

        
        // MARK: - UI properties (Private)
        func defaultTitleView() -> SBUNavigationTitleView? { return nil }
        
        func defaultLeftButton() -> UIBarButtonItem {
            let backButton = SBUBarButtonItem.backButton(
                vc: self,
                selector: #selector(onTapLeftBarButton)
            )
            return backButton
        }
        
        func defaultRightButton() -> UIBarButtonItem {
            let editButton =  UIBarButtonItem(
                title: SBUStringSet.Edit,
                style: .plain,
                target: self,
                action: #selector(onTapRightBarButton)
            )
            editButton.setTitleTextAttributes([.font : SBUFontSet.button2], for: .normal)
            return editButton
        }
        
        
        
        // MARK: - Logic properties (Public)
        weak var baseDelegate: SBUBaseChannelSettingsModuleHeaderDelegate? = nil
        weak var baseDataSource: SBUBaseChannelSettingsModuleHeaderDataSource? = nil
        
        
        // MARK: - LifeCycle
        
        /// Set values of the views in the header component when it needs.
        open func setupViews() {
            if self.titleView == nil {
                self.titleView = self.defaultTitleView()
            }
            if self.leftBarButton == nil {
                self.leftBarButton = self.defaultLeftButton()
            }
            if self.rightBarButton == nil {
                self.rightBarButton = self.defaultRightButton()
            }
        }
        
        /// Sets layouts of the views in the header component.
        open func setupLayouts() { }
        
        /// Sets styles of the views in the header component with the `theme`.
        /// - Parameter theme: The object that is used as the theme of the header component. The theme must adopt the `SBUChannelSettingsTheme` class.
        open func setupStyles(theme: SBUChannelSettingsTheme? = nil) {
            if let theme = theme {
                self.theme = theme
            }
            
            if let titleView = self.titleView as? SBUNavigationTitleView {
                titleView.setupStyles()
            }
            
            self.leftBarButton?.tintColor = theme?.leftBarButtonTintColor
            self.rightBarButton?.tintColor = theme?.rightBarButtonTintColor
        }

        
        // MARK: - Attach update delegate on view
        
        /// Called when the `titleView` was updated.
        func didUpdateTitleView() { }
        /// Called when the `leftBarButton` was updated.
        func didUpdateLeftItem() { }
        /// Called when the `rightBarButton` was updated.
        func didUpdateRightItem() { }
        
        
        // MARK: - Actions
        /// Called when the `leftBarButton` was tapped.
        @objc open func onTapLeftBarButton() { }
        /// Called when the `rightBarButton` was tapped.
        @objc open func onTapRightBarButton() { }
    }
}
