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
    private let photoImage : UIImageView = UIImageView()
    private let photoDescription : UILabel  = UILabel()
    
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
        addSubview(ownerName)
        addSubview(photoImage)
        addSubview(photoDescription)
        
        
        ownerName.font = .boldSystemFont(ofSize: 20)
        photoDescription.font = .italicSystemFont(ofSize: 10)
        ownerName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
        }
        
        photoImage.snp.makeConstraints { make in
            make.top.equalTo(ownerName.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
        }
        
        photoDescription.snp.makeConstraints { make in
            make.top.equalTo(photoImage.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func saveDatas(model : Photo){
        ownerName.text = model.ownername
        photoDescription.text = model.title
        photoImage.af.setImage(withURL: URL(string: model.urlL ?? customImage) ?? URL(string: customImage)!)
    }
    
}
