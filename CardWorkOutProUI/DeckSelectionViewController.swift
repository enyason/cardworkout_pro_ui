//
//  DeckSelectionViewController.swift
//  CardWorkOutProUI
//
//  Created by Emmanuel Enya on 18/04/2023.
//

import UIKit

class DeckSelectionViewController : UIViewController {
    
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    let defaultDeck = UIImage(named: "AS")!
    
    
    var timer : Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startCardShuffling()
    }
    
    func configureUI(){
        configureCardImage()
        configureStopButtons()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(showRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }
    
   
    func configureRestartButton(){
        view.addSubview(resetButton)
        
        resetButton.addTarget(self, action: #selector(restartCardShuffling), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    
    func configureStopButtons(){
        view.addSubview(stopButton)
        
        stopButton.addTarget(self, action: #selector(stopCardShuffling), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
   func configureCardImage(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    @objc func showRulesVC(){
        present(RulesViewController(), animated: true)
    }
    
    @objc func startCardShuffling(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(seleectRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopCardShuffling(){
        timer.invalidate()
    }
    
    @objc func restartCardShuffling(){
        cardImageView.image = defaultDeck
        stopCardShuffling()
        startCardShuffling()
    }
    
    @objc func seleectRandomCard() {
        cardImageView.image =  Deck.allValues.randomElement() ?? defaultDeck
    }
}
