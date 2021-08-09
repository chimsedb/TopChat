//
//  ViewController.swift
//  TopChat
//
//  Created by Hung Dang on 8/9/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let top1 = TopLiveView()
        top1.topType = .TOP_1
        let top2 = TopLiveView()
        top2.topType = .TOP_2
        let top3 = TopLiveView()
        top3.topType = .TOP_3
        view.addSubview(top1)
        view.addSubview(top2)
        view.addSubview(top3)

        top1.translatesAutoresizingMaskIntoConstraints = false
        top1.rightAnchor.constraint(equalTo: top2.leftAnchor,constant: 20).isActive = true
        top1.topAnchor.constraint(equalTo: top2.topAnchor).isActive = true
        top1.bottomAnchor.constraint(equalTo: top2.bottomAnchor).isActive = true
        top1.widthAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        top1.heightAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        
        top2.translatesAutoresizingMaskIntoConstraints = false
        top2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        top2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        top2.widthAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        top2.heightAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        
        top3.translatesAutoresizingMaskIntoConstraints = false
        top3.leftAnchor.constraint(equalTo: top2.rightAnchor,constant: -20).isActive = true
        top3.topAnchor.constraint(equalTo: top2.topAnchor).isActive = true
        top3.bottomAnchor.constraint(equalTo: top2.bottomAnchor).isActive = true
        top3.widthAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        top1.heightAnchor.constraint(equalToConstant: CGFloat(90)).isActive = true
        
        top1.changeAvatarImage("https://httpbin.org/image/png")
        top2.changeAvatarImage("https://httpbin.org/image/png")
        top3.changeAvatarImage("https://httpbin.org/image/png")
    }
}
