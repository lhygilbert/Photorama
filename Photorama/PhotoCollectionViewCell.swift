//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Gilbert Lo on 1/23/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iV = UIImageView()
        iV.contentMode = .scaleAspectFill
        iV.translatesAutoresizingMaskIntoConstraints = false
        return iV
    }()
    
    let spinner: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        update(with: nil)
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 20),
            spinner.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        update(with: nil)
//    }

    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: nil)
    }
    
}
