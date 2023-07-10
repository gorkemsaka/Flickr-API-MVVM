//
//  FlickrViewModel.swift
//  Flickr Clone App
//
//  Created by Gorkem Saka on 6/27/23.
//

import Foundation

// MARK: - FlickrViewModel Protocol
protocol IFlickrViewModel{
    
    var flickrPhotos : [Photo]? { get set }
    var flickrService : IFlickrService { get }
    
    var viewModelPresenter : ViewModelPresenter?{ get }
    
    func getDatas()
    func changeLoading()
    func setDelegate(output: ViewModelPresenter)
}

// MARK: - FlickrViewModel
final class FlickrViewModel : IFlickrViewModel{
    var viewModelPresenter: ViewModelPresenter?
    
    func setDelegate(output: ViewModelPresenter) {
        viewModelPresenter = output
    }
    
    var flickrPhotos: [Photo]? = []
    private var isLoading = false
    
    
    // init oldugunda, service objesi olustur
    init() {
        flickrService = FlickrService()
    }
    
    var flickrService: IFlickrService
    
    func getDatas() {
        changeLoading()
        flickrService.fetchAllData { [weak self] response in
            self?.changeLoading()
            self?.flickrPhotos = response ?? []
            self?.viewModelPresenter?.getDatas(values: self?.flickrPhotos ?? [])
        }
    }
    
    func changeLoading() {
        isLoading  = !isLoading
        viewModelPresenter?.isLoading(isLoad: isLoading
        )
        
    }
    
    
}
