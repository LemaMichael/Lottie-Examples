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
    
    var currentAnimation = "loading"
    let animations = ["loading", "material_wave_loading", "preloader"]

    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("Next Animation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    let animationView: LOTAnimationView = {
        let view = LOTAnimationView()
        view.loopAnimation = true
        return view
    }()
    
    @objc fileprivate func handleTap() {
        if currentAnimation == "preloader" {
            currentAnimation = "loading"
        } else {
            if let i = animations.index(where: { $0 == currentAnimation }) {
                currentAnimation =  animations[i + 1]
            }
        }
        animationView.setAnimation(named: currentAnimation)

        animationView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.curveEaseOut], animations: {
            self.animationView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        animationView.loopAnimation = true
        animationView.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red:0.17, green:0.17, blue:0.24, alpha:1.00)
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
        animationView.setAnimation(named: animations[0])
        animationView.play()
    }
    
    
}

