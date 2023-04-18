//
//  RulesViewController.swift
//  CardWorkOutProUI
//
//  Created by Emmanuel Enya on 18/04/2023.
//

import UIKit


class RulesViewController : UIViewController{
    
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let deckLabel = UILabel()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI(){
        configureTitleLabel()
        configureRulesLabel()
        configureDeckLabel()
    }
    
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        ])
    }
    
    
    func configureRulesLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.text = "The value of each card represents the number of exercise that you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25)
        ])
    }
    
    func configureDeckLabel(){
        view.addSubview(deckLabel)
        deckLabel.text = "♠️ = Push-up \n\n❤️ = Sit-up \n\n♣️ = Burpees \n\n♦️= Jumping Jacks"
        deckLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        deckLabel.translatesAutoresizingMaskIntoConstraints = false
        deckLabel.lineBreakMode = .byWordWrapping
        deckLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            deckLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deckLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60)
        ])
    }
}
