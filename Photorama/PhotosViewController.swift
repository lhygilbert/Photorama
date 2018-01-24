//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Gilbert Lo on 1/22/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    static let cellId = "cellId"
    lazy var collectionView: UICollectionView = {
        let viewFlowLayout = UICollectionViewFlowLayout()
        viewFlowLayout.itemSize = CGSize(width: 90, height: 90)
        viewFlowLayout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2)
        viewFlowLayout.minimumLineSpacing = 2
        viewFlowLayout.minimumInteritemSpacing = 2
        
        let cV = UICollectionView(frame: self.view.frame, collectionViewLayout: viewFlowLayout)
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.backgroundColor = .clear
        return cV
    }()
    let photoDataSource = PhotoDataSource()
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotosViewController.cellId)
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos { (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Sucessfully found \(photos.count) photos")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func setupView() {
        self.navigationItem.title = "Photorama"
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        store.fetchImage(for: photo) { (result) in
            
            guard let photoIndex = self.photoDataSource.photos.index(of: photo), case let .success(image) = result else {
                return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
            
        }
    }
}
