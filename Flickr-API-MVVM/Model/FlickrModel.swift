// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class Welcome: Codable {
    let photos: Photos?

    init(photos: Photos?) {
        self.photos = photos
    }
}

// MARK: - Photos
class Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?

    init(page: Int?, pages: Int?, perpage: Int?, total: Int?, photo: [Photo]?) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photo = photo
    }
}

// MARK: - Photo
class Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    let ownername, iconserver: String?
    let iconfarm: Int?
    let originalsecret, originalformat: String?
    let urlT: String?
    let heightT, widthT: Int?
    let urlS: String?
    let heightS, widthS: Int?
    let urlQ: String?
    let heightQ, widthQ: Int?
    let urlM: String?
    let heightM, widthM: Int?
    let urlN: String?
    let heightN, widthN: Int?
    let urlZ: String?
    let heightZ, widthZ: Int?
    let urlC: String?
    let heightC, widthC: Int?
    let urlL: String?
    let heightL, widthL: Int?
    let urlO: String?
    let heightO, widthO: Int?

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, ownername, iconserver, iconfarm, originalsecret, originalformat
        case urlT = "url_t"
        case heightT = "height_t"
        case widthT = "width_t"
        case urlS = "url_s"
        case heightS = "height_s"
        case widthS = "width_s"
        case urlQ = "url_q"
        case heightQ = "height_q"
        case widthQ = "width_q"
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
        case urlN = "url_n"
        case heightN = "height_n"
        case widthN = "width_n"
        case urlZ = "url_z"
        case heightZ = "height_z"
        case widthZ = "width_z"
        case urlC = "url_c"
        case heightC = "height_c"
        case widthC = "width_c"
        case urlL = "url_l"
        case heightL = "height_l"
        case widthL = "width_l"
        case urlO = "url_o"
        case heightO = "height_o"
        case widthO = "width_o"
    }

    init(id: String?, owner: String?, secret: String?, server: String?, farm: Int?, title: String?, ispublic: Int?, isfriend: Int?, isfamily: Int?, ownername: String?, iconserver: String?, iconfarm: Int?, originalsecret: String?, originalformat: String?, urlT: String?, heightT: Int?, widthT: Int?, urlS: String?, heightS: Int?, widthS: Int?, urlQ: String?, heightQ: Int?, widthQ: Int?, urlM: String?, heightM: Int?, widthM: Int?, urlN: String?, heightN: Int?, widthN: Int?, urlZ: String?, heightZ: Int?, widthZ: Int?, urlC: String?, heightC: Int?, widthC: Int?, urlL: String?, heightL: Int?, widthL: Int?, urlO: String?, heightO: Int?, widthO: Int?) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        self.ownername = ownername
        self.iconserver = iconserver
        self.iconfarm = iconfarm
        self.originalsecret = originalsecret
        self.originalformat = originalformat
        self.urlT = urlT
        self.heightT = heightT
        self.widthT = widthT
        self.urlS = urlS
        self.heightS = heightS
        self.widthS = widthS
        self.urlQ = urlQ
        self.heightQ = heightQ
        self.widthQ = widthQ
        self.urlM = urlM
        self.heightM = heightM
        self.widthM = widthM
        self.urlN = urlN
        self.heightN = heightN
        self.widthN = widthN
        self.urlZ = urlZ
        self.heightZ = heightZ
        self.widthZ = widthZ
        self.urlC = urlC
        self.heightC = heightC
        self.widthC = widthC
        self.urlL = urlL
        self.heightL = heightL
        self.widthL = widthL
        self.urlO = urlO
        self.heightO = heightO
        self.widthO = widthO
    }
}
