//
//  TopChatView.swift
//  TopChat
//
//  Created by Hung Dang on 8/9/21.
//

import Alamofire
import AlamofireImage
import UIKit

public enum TopType {
    case TOP_1
    case TOP_2
    case TOP_3
}

class TopLiveView: UIView {
    private let frameNames = ["King", "Queen", "Joker"]
    public var topType: TopType?
    private let frameTop = UIImageView()
    private let avatarTop = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setUpView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let topType = topType else {
            return
        }
        switch topType {
        case .TOP_1:
            setUpView(frameNames[0])
            initTopChatView(xCenter: centerXAnchor, yCenter: centerYAnchor, yMove: 5, xMove: 0,
                            widthFrame: 73, heightFrame: 54, radiusAvatar: 17,
                            avatar: avatarTop, frame: frameTop)
            break
        case .TOP_2:
            setUpView(frameNames[1])
            initTopChatView(xCenter: centerXAnchor, yCenter: centerYAnchor, yMove: 3, xMove: 0,
                            widthFrame: 56, heightFrame: 54, radiusAvatar: 18,
                            avatar: avatarTop, frame: frameTop)
            break
        case .TOP_3:
            setUpView(frameNames[2])
            initTopChatView(xCenter: centerXAnchor, yCenter: centerYAnchor, yMove: 5, xMove: 0,
                            widthFrame: 48, heightFrame: 53, radiusAvatar: 16,
                            avatar: avatarTop, frame: frameTop)
            break
        }
    }

    private func setUpView(_ frameName: String) {
        let frameImage = UIImage(named: frameName)
        frameTop.image = frameImage
        avatarTop.backgroundColor = .white
        addSubview(frameTop)
        addSubview(avatarTop)
    }

    private func initTopChatView(xCenter: NSLayoutXAxisAnchor, yCenter: NSLayoutYAxisAnchor, yMove: CGFloat, xMove: CGFloat,
                                 widthFrame: CGFloat, heightFrame: CGFloat, radiusAvatar: CGFloat,
                                 avatar: UIImageView, frame: UIImageView) {
        frame.translatesAutoresizingMaskIntoConstraints = false
        frame.centerYAnchor.constraint(equalTo: yCenter).isActive = true
        frame.centerXAnchor.constraint(equalTo: xCenter).isActive = true
        frame.heightAnchor.constraint(equalToConstant: CGFloat(heightFrame)).isActive = true
        frame.widthAnchor.constraint(equalToConstant: CGFloat(widthFrame)).isActive = true

        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.centerYAnchor.constraint(equalTo: frame.centerYAnchor, constant: yMove).isActive = true
        avatar.centerXAnchor.constraint(equalTo: frame.centerXAnchor, constant: xMove).isActive = true

        avatar.heightAnchor.constraint(equalToConstant: CGFloat(radiusAvatar * 2)).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: CGFloat(radiusAvatar * 2)).isActive = true

        avatar.layer.cornerRadius = radiusAvatar
    }

    public func changeAvatarImage(_ url: String) {
        AF.request(url).responseImage { response in

            if case let .success(image) = response.result {
                print("image downloaded: \(image)")
                self.avatarTop.image = image
            }
        }
    }
}
