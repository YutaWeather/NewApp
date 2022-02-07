//
//  ContentCell.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import UIKit

class ContentCell: UITableViewCell {

    static var identifier = "ContentCell"
    var titleLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(title:String){
        
        layoutUI()
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        
    }
    
    func layoutUI(){
        
        self.addSubview(titleLabel)
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: padding),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
        ])
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
