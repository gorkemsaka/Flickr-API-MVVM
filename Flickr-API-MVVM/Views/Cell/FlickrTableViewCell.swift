//
//  FlickrTableViewCell.swift
//  Flickr Clone App
//
//  Created by Gorkem Saka on 6/28/23.
//

import UIKit
import SnapKit
import AlamofireImage

class FlickrTableViewCell: UITableViewCell {
    
    private let ownerName : UILabel = UILabel()
    private let ownerProfilePhoto : UIImageView = UIImageView()
    private let photoImage : UIImageView = UIImageView()
    private let photoDescription : UILabel  = UILabel()
    
    private let flickerService : FlickrService = FlickrService()
    
    private let customImage = "https://picsum.photos/200/300"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    enum Identifier: String {
        case cellIdentifierName = "flickrRecentPhotoCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(ownerProfilePhoto)
        addSubview(ownerName)
        addSubview(photoImage)
        addSubview(photoDescription)
        drawDesign()
    }
    
    
    func drawDesign() {
        ownerName.font = .boldSystemFont(ofSize: 18)
        photoDescription.font = .italicSystemFont(ofSize: 12)
        
        ownerProfilePhoto.layer.cornerRadius = 24
        ownerProfilePhoto.layer.masksToBounds = true
        
        ownerProfilePhoto.snp.makeConstraints { make in
            make.size.equalTo(48)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        ownerName.snp.makeConstraints { make in
            make.centerY.equalTo(ownerProfilePhoto)
            make.left.equalTo(ownerProfilePhoto.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        photoImage.snp.makeConstraints { make in
            make.top.equalTo(ownerProfilePhoto.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        photoDescription.snp.makeConstraints { make in
            make.top.equalTo(photoImage.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
    }

    
    func saveDatas(model : Photo){
        ownerName.text = model.ownername
        photoDescription.text = model.title
        flickerService.fetchBuddyIcon(model: model, view: ownerProfilePhoto)
        photoImage.af.setImage(withURL: URL(string: model.urlL ?? customImage) ?? URL(string: customImage)!)
    }
    
}
