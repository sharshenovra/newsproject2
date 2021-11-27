//
//  DetailedNewsViewController.swift
//  DetailedNewsViewController
//
//  Created by Ruslan Sharshenov on 27.11.2021.
//

import Foundation
import UIKit


class DetailedNewsViewController: UIViewController{
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var DetailedPhoto: UIImageView!
    @IBOutlet weak var DetailedLabel: UILabel!
    
    private var model: NewsModel? = nil
    
    func fill(model: NewsModel) {
        self.model = model
    }
    
    override func viewDidLoad() {
        title = model?.title
        firstLabel.text = model?.title
        DetailedLabel.text = model?.descriptions
        DetailedPhoto.image = UIImage(named: model?.image ?? "0")
    }
}
