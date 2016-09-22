//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Patrick Hansen on 9/20/16.
//  Copyright © 2016 Patrick Hansen. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchInterestingPhotos()
    }

}
