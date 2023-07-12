//
//  RecentPhotosViewController.swift
//  Flickr-API-MVVM
//
//  Created by Gorkem Saka on 7/7/23.
//

import Foundation
import UIKit
import SnapKit
import AlamofireImage
import Alamofire


final class RecentPhotosViewController : UIViewController {
    private let ownerProfilePhoto : UIImageView = UIImageView()
//    private var ownerName : UILabel = UILabel()
    //    private let recentPhotoImage : UIImageView = UIImageView()
    //    private let recentPhotoDescription : UILabel = UILabel()
    //
    
    private lazy var results : [Photo?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        drawDesign()
    }
}

extension RecentPhotosViewController{
    
    func configure(){
        view.backgroundColor = .white
        view.addSubview(ownerProfilePhoto)
//        view.addSubview(ownerName)
//        view.addSubview(recentPhotoImage)
//        view.addSubview(recentPhotoDescription)
    }
    
    
    func drawDesign(){
        ownerProfilePhoto.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(48)
            make.centerX.centerY.equalToSuperview()
        }
//        ownerName.snp.makeConstraints { make in
//            make.centerY.equalTo(ownerProfilePhoto.snp.centerY)
//                        make.left.equalTo(ownerProfilePhoto.snp.right).offset(10)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.left).offset(10)
//        }
    }
    
    
    func saveDatas(model : Photo) {
//        ownerName.text = model.ownername
        //        guard let url = URL(string: model.urlZ ?? "") else { return }
        //        recentPhotoDescription.text = model.ownername
        //        recentPhotoImage.af.setImage(withURL: url)
        
        getBuddyIcon(model: model)
    }
}


extension RecentPhotosViewController {
    
    func getBuddyIcon(model : Photo?) {
        let iconFarm = model?.iconfarm
        let iconServer = model?.iconserver
        let nsID = model?.owner
        
        let buddyIconUrlString : String = "http://farm\(iconFarm!).staticflickr.com/\(iconServer!)/buddyicons/\(nsID!).jpg"
        let defaultBuddyIconUrlString : String = "https://www.flickr.com/images/buddyicon.gif"
        
        saveBuddyIcon(buddyIcon: buddyIconUrlString, defaultIcon: defaultBuddyIconUrlString)
    }
    
    func saveBuddyIcon(buddyIcon : String, defaultIcon : String){
        ownerProfilePhoto.af.setImage(withURL: (URL(string: buddyIcon) ?? URL(string: defaultIcon))!)
    }
}
