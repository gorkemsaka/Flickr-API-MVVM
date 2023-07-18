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
    
    private let flickrService : FlickrService = FlickrService()
    private let ownerProfilePhoto : UIImageView = UIImageView()
    private var ownerName : UILabel = UILabel()
    private let recentPhotoImage : UIImageView = UIImageView()
    private let recentPhotoDescription : UILabel = UILabel()
    
    private let customImage = "https://picsum.photos/200/300"
    
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
        view.addSubview(ownerName)
        view.addSubview(recentPhotoImage)
        view.addSubview(recentPhotoDescription)
    }
    
    
    func drawDesign(){
        ownerProfilePhoto.layer.cornerRadius = 24
        ownerProfilePhoto.layer.masksToBounds = true
        
        ownerProfilePhoto.snp.makeConstraints { make in
            make.size.equalTo(48)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        ownerName.snp.makeConstraints { make in
            make.centerY.equalTo(ownerProfilePhoto)
            make.left.equalTo(ownerProfilePhoto.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        recentPhotoImage.snp.makeConstraints { make in
            make.top.equalTo(ownerProfilePhoto.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        recentPhotoDescription.snp.makeConstraints { make in
            make.top.equalTo(recentPhotoImage.snp.bottom)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
        }    }
    
    
    func saveDatas(model : Photo) {
        ownerName.text = model.ownername
        flickrService.fetchBuddyIcon(model: model, view: ownerProfilePhoto)
        recentPhotoImage.af.setImage(withURL: URL(string: model.urlZ ?? customImage) ?? URL(string: customImage)!)
        recentPhotoDescription.text = model.title
    }
}



