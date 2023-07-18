//
//  FlickrService.swift
//  Flickr Clone App
//
//  Created by Gorkem Saka on 6/25/23.
//

import Alamofire


enum FlickrServiceEndPoint : String {
    case BASE_URL = "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=9054aeed46a700648fd8682af1bf23e8&format=json&nojsoncallback=1&extras="
    case PATH = "owner_name,icon_server,original_format,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o"
    
    static func extrasPath() -> String{
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


protocol IFlickrService {
    func fetchAllData(response: @escaping ([Photo]?) -> Void )
}


struct FlickrService : IFlickrService{
    
    func fetchAllData(response: @escaping ([Photo]?) -> Void) {
        AF.request(FlickrServiceEndPoint.extrasPath()).responseDecodable(of: Welcome.self) {
            data in
            guard let data = data.value else {
                response(nil)
                return
            }
            response(data.photos?.photo)
        }
    }
    
    func fetchBuddyIcon(model : Photo?, view : UIImageView){
        let iconFarm = model?.iconfarm
        let iconServer = model?.iconserver
        let nsID = model?.owner
        
        
        let buddyIconUrlString : String = "http://farm\(iconFarm!).staticflickr.com/\(iconServer!)/buddyicons/\(nsID!).jpg"
        let defaultBuddyIconUrlString : String = "https://www.flickr.com/images/buddyicon.gif"
        
        
        view.af.setImage(withURL: (URL(string: buddyIconUrlString) ?? URL(string: defaultBuddyIconUrlString))!)
    }
}
