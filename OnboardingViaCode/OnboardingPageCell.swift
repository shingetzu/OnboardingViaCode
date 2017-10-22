//
//  OnboardingPageCell.swift
//  OnboardingViaCode
//
//  Created by Jonathan Go on 2017/10/22.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class OnboardingPageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            imageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: color]))
            //textView.text = page.title + "\n\n" + page.message
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }

    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "Zelda")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageView.anchorToTop(top: topAnchor, left: leadingAnchor, bottom: textView.topAnchor, right: trailingAnchor)
        
        textView.anchorWithConstraintsToTop(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: -16)
        
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    
        lineSeparatorView.anchorToTop(top: nil, left: leadingAnchor, bottom: textView.topAnchor, right: trailingAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}