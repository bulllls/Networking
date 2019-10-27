//
//  ViewController.swift
//  Networking
//
//  Created by Ruslan on 10/24/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class DownloadImageViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dowloadLabel: UILabel!
    @IBOutlet weak var dowloadButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }


    @IBAction func dowloadActionButton(_ sender: Any) {
        
        dowloadLabel.isHidden = true
        dowloadButton.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let imageSession = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.image.image = imageSession
                }
            }
        }.resume()
        
    }
}

