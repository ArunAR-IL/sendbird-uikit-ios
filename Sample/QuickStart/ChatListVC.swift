//
//  File.swift
//  ChatApp
//
//  Created by iLeafiMac on 28/07/22.
//

import Foundation
import UIKit
import SendbirdChatSDK
protocol UpdateChannelListDelegate{
    func updateChannelWithUrl(channel:GroupChannel)
}
class ChannelListVC: SBUGroupChannelListViewController,UpdateChannelListDelegate {
    var onFinish: (() -> Void)?
    override init() {
        super.init()
        self.headerComponent?.titleView = self.createCustomTitleLabel()
    
//        self.headerComponent?.leftBarButton?.tintColor = UIColor.white
//        self.headerComponent?.rightBarButton?.tintColor = UIColor.white
//        self.headerComponent?.leftBarButton = self.createHighlightedBackButton()
//        self.headerComponent?.tintColor = UIColor.white
        

        
        
        
        
//        let autoAccept = false
//        SendbirdChat.setChannelInvitationPreference(autoAccept: autoAccept) { error in
//            guard error == nil else {
//                // Handle error.
//                return
//            }
//        }
        
    }

   
    required init(channelListQuery: GroupChannelListQuery? = nil) {
           super.init(channelListQuery: channelListQuery)
//        let autoAccept = false
//        SendbirdChat.setChannelInvitationPreference(autoAccept: autoAccept) { error in
//            guard error == nil else {
//                // Handle error.
//                return
//            }
//        }
        
        self.headerComponent?.titleView = self.createCustomTitleLabel()
//        self.headerComponent?.leftBarButton?.tintColor = UIColor.white
//        self.headerComponent?.rightBarButton?.tintColor = UIColor.white
//        self.headerComponent?.leftBarButton = self.createHighlightedBackButton()
//        self.headerComponent?.tintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = SBUTheme.channelCellTheme.separatorLineColor.image(CGSize(width: self.view.frame.width, height: 1))
        
       // self.headerComponent?.titleView?.addSubview(seperatorLineView)
        //self.navigationController?.view.addSubview(seperatorLineView)
       }
   
    
    func createHighlightedBackButton() -> UIBarButtonItem {
        let leftButton = UIBarButtonItem(image: UIImage.init(named: "ic_back"), style: .plain, target: self, action: #selector(onClickBack))
        leftButton.tintColor = UIColor.white
        return leftButton
       
    }
    func updateChannelWithUrl(channel:GroupChannel) {
        var newChannelList:[GroupChannel] = []
        newChannelList.append(contentsOf: self.channelList)
        newChannelList.append(channel)
        let params2 = GroupChannelListQueryParams()
        params2.includeEmptyChannel = true
        params2.myMemberStateFilter = MyMemberStateFilter.joinedOnly
        let listQuery2 = GroupChannel.createMyGroupChannelListQuery(params: params2)
//        self.viewModel?.updateChannels([GroupChannel]?, needReload: <#T##Bool#>)
        //self.viewModel?.customizedChannelListQuery = listQuery2
    }
    func createCustomTitleLabel() -> UILabel {
            let titleLabel = UILabel()
            titleLabel.text = "Messages"
            titleLabel.textColor = UIColor.white
            return titleLabel
        }
    
  


    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
//    override func groupChannelListViewModel(
//        _ viewModel: SBUGroupChannelListViewModel,
//        didChangeChannelList channels: [GroupChannel]?,
//        needsToReload: Bool
//    ) {
//        self.viewModel?.channelCollection?.loadMore(completionHandler: { (groupChannels, error) in
//
//        });
//    }
    
    override func channelListModule(_ headerComponent: SBUGroupChannelListModule.Header, didTapRightItem rightItem: UIBarButtonItem) {
        let params2 = GroupChannelListQueryParams()
        params2.includeEmptyChannel = true
        params2.myMemberStateFilter = MyMemberStateFilter.joinedOnly
        let listQuery2 = GroupChannel.createMyGroupChannelListQuery(params: params2)
        self.viewModel?.updateChannelListQuery(newQuery: listQuery2)
    }
}


extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}
