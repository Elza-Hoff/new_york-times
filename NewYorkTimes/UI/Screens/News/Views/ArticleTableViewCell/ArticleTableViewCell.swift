//
//  ArticleTableViewCell.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: - Defaults
    
    private enum Defaults {
        static let icon: UIImage? = UIImage(named: "photo.on.rectangle")
    }
    
    //MARK: - Properties
        
    @IBOutlet weak private var lblTitle: UILabel!
    
    @IBOutlet weak private var ivIcon: UIImageView!
    
    @IBOutlet weak private var lblDescription: UILabel!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.refreshUI()
    }
    
    func configureCellWith(title: String, description: String, icon: UIImage?) {
        self.lblTitle.text = title
        self.lblDescription.text = description
        self.ivIcon.image = icon
    }
    
    private func refreshUI() {
        self.lblTitle.text = nil
        self.lblDescription.text = nil
        self.ivIcon.image = Defaults.icon
    }
    
}

//MARK: - AutoidentifierCell
extension ArticleTableViewCell: AutoIndentifierCell {}
