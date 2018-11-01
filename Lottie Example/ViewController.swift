//
//  ViewController.swift
//  Lottie Example
//
//  Created by Michael Lema on 10/31/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var currentAnimation = "bitcoin_to_the_moon"
    let animations = ["bitcoin_to_the_moon", "deadpool"]

    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("Next Animation", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    let animationView: LOTAnimationView = {
        let view = LOTAnimationView()
        view.loopAnimation = true
        return view
    }()
    
    @objc fileprivate func handleTap() {
        currentAnimation = currentAnimation == "bitcoin_to_the_moon" ?  animations[1] : animations[0]
        animationView.setAnimation(named: currentAnimation)
        animationView.loopAnimation = true
        animationView.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        beginAnimation()
        
        view.addSubview(animationView)
        view.addSubview(button)
        
        animationView.anchor(top: nil, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 350)
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.anchor(top: nil, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 250, height: 60)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
    func beginAnimation() {
        animationView.setAnimation(named: currentAnimation)
        animationView.play()
    }
    
    
}

