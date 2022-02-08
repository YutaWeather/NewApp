//
//  ContentCell.swift
//  NewAppMVVM
//
//  Created by Yuta Fujii on 2022/02/04.
//

import UIKit
import Combine

//protocol UserNameCellDelegate{
//    func showName(for user:User)
//}

class ContentCell: UITableViewCell {

    static var identifier = "ContentCell"
    var titleLabel = UILabel()
//    var delegate:UserNameCellDelegate?
    var button = UIButton()
    let action = PassthroughSubject<String,Never>()
    private var user:User?
    
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

    func configure(user:User){
        
        layoutUI()
        self.user = user
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = self.user?.name
        titleLabel.numberOfLines = 0
        
      
    }

    
    func configureButtonUI(){
        
        layoutButtonUI()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("ボタン", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }
    
    @objc func tapButton(){
        
        action.send("選択されました")
        
    }
    
    func layoutButtonUI(){
        
        self.contentView.addSubview(button)
        let padding:CGFloat = 20
        NSLayoutConstraint.activate([
            
            button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: padding),
            button.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: padding),
            button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -padding),
            button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -padding)
        ])
        
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
