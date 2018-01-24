//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by Gilbert Lo on 1/23/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = PhotosViewController.cellId
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! PhotoCollectionViewCell
        cell.backgroundColor = .black
        
        return cell
    }
}
