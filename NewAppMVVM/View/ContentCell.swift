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
    var showNameButton = UIButton()
    var showEmailButton = UIButton()
    
//    var showAlertPublisher = PassthroughSubject<User,Never>()
    
    var actionPublisher = PassthroughSubject<Action,Never>()
    
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
        
        showNameButton.translatesAutoresizingMaskIntoConstraints = false
        showNameButton.backgroundColor = .yellow
        showNameButton.setTitle("名前", for: .normal)
        showNameButton.setTitleColor(.black, for: .normal)
        showNameButton.addTarget(self, action: #selector(tapShowNameButton), for: .touchUpInside)
        
        showEmailButton.translatesAutoresizingMaskIntoConstraints = false
        showEmailButton.backgroundColor = .blue
        showEmailButton.setTitle("メール", for: .normal)
        showEmailButton.setTitleColor(.black, for: .normal)
        showEmailButton.addTarget(self, action: #selector(tapShowEmailButton), for: .touchUpInside)
        
      
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
    
    
    @objc func tapShowNameButton(){
        
        actionPublisher.send(.showAlert(self.user!))
        
    }
    
    @objc func tapShowEmailButton(){
        
        actionPublisher.send(.otherShowAlert(self.user!))
        
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
        self.addSubview(showNameButton)
        self.addSubview(showEmailButton)
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: padding),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -padding),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
            titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width/2),
            
            showNameButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            showNameButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
//            showNameButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showNameButton.widthAnchor.constraint(equalToConstant: self.frame.width/4),
            showNameButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            showEmailButton.leadingAnchor.constraint(equalTo: showNameButton.trailingAnchor),
            showEmailButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
//            showNameButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showEmailButton.widthAnchor.constraint(equalToConstant: self.frame.width/4),
            showEmailButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
            
        ])
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ContentCell{
    
    enum Action {
        
        case showAlert(User)
        case otherShowAlert(User)
    
    }
    
}
