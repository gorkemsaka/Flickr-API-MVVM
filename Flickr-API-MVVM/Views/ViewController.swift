//
//  ViewController.swift
//  Flickr Clone App
//
//  Created by Gorkem Saka on 6/20/23.
//

import UIKit
import SnapKit


protocol ViewModelPresenter{
    func isLoading(isLoad : Bool)
    func getDatas(values : [Photo?])
    func getBuddyIcon(model : [Photo?])
}

final class ViewController: UIViewController {
    
    private let labelTitle : UILabel = UILabel()
    private let tableView : UITableView = UITableView()
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var results : [Photo?] = []
    
    var viewModel : IFlickrViewModel = FlickrViewModel()
    var recentPhotosVC : RecentPhotosViewController = RecentPhotosViewController()
    
    private let appTitle : String = "Flickr Api App MVVM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDeisgn()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.getDatas()
    }
    
    // MARK: - configure & drawDeisgn funcs
    private func configure(){
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        tableView.register(FlickrTableViewCell.self, forCellReuseIdentifier: FlickrTableViewCell.Identifier.cellIdentifierName.rawValue)
        tableView.rowHeight = 300
        
        
        labelConstraints()
        tableViewConstraints()
        indicatorConstraints()
    }
    
    private func drawDeisgn(){
        // tableView olusturduktan sonra, asagidakileri set etmemiz gerekiyor. Aksi halde tableview gozukmez
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // bu isleri, main thread'e tasiyoruz
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = self.appTitle
            self.indicator.color = .red
            self.indicator.startAnimating()
        }
        
    }
}
// MARK: - FlickrPresent Procotol
extension ViewController : ViewModelPresenter {
    
    func getBuddyIcon(model: [Photo?]) {
        results = model
    }
    
    
    func getDatas(values: [Photo?]) {
        results = values
        tableView.reloadData()
    }

    func isLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : FlickrTableViewCell = tableView.dequeueReusableCell(withIdentifier: FlickrTableViewCell.Identifier.cellIdentifierName.rawValue) as? FlickrTableViewCell else{
            return UITableViewCell()
        }
        cell.saveDatas(model: results[indexPath.row]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPhoto = results[indexPath.row]
        recentPhotosVC.saveDatas(model: currentPhoto!)
        navigationController?.pushViewController(recentPhotosVC, animated: true)
    }
}


// MARK: - Constraints Extension for ViewController
extension ViewController{
    private func labelConstraints(){
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
        
    }
    private func tableViewConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview().offset(5)
        }
    }
    private  func indicatorConstraints(){
        indicator.snp.makeConstraints { make in
            make.height.equalTo (labelTitle)
            make.right.equalTo (labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
        
    }
}



