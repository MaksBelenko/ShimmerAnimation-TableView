//
//  TableViewCell.swift
//  ShimmerTableView
//
//  Created by Maksim on 25/07/2020.
//  Copyright © 2020 Maksim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    private var testLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "Test label"
        label.textColor = .black
        return label
    }()
    
    private var bottomBoxView : UIView = {
        let view = UIView()
        view.backgroundColor = .bottomGray
        return view
    }()
    
    private var topBoxView : UIView = {
        let view = UIView()
        view.backgroundColor = .shimmerGray
        return view
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.shimmerGray.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        return gradientLayer
    }()
    
    
    var shimmerAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }()
    
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureBox()
//        addSubview(testLabel)
//        testLabel.translatesAutoresizingMaskIntoConstraints = false
//        testLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        testLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - Configure UI
    
    private func configureBox() {
        addSubview(bottomBoxView)
        bottomBoxView.translatesAutoresizingMaskIntoConstraints = false
        bottomBoxView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bottomBoxView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bottomBoxView.heightAnchor.constraint(equalToConstant: frame.height / 1.5).isActive = true
        bottomBoxView.widthAnchor.constraint(equalToConstant: frame.width / 2).isActive = true
        
        addSubview(topBoxView)
        topBoxView.translatesAutoresizingMaskIntoConstraints = false
        topBoxView.centerYAnchor.constraint(equalTo: bottomBoxView.centerYAnchor).isActive = true
        topBoxView.centerXAnchor.constraint(equalTo: bottomBoxView.centerXAnchor).isActive = true

        topBoxView.heightAnchor.constraint(equalTo: bottomBoxView.heightAnchor).isActive = true
        topBoxView.widthAnchor.constraint(equalTo: bottomBoxView.widthAnchor).isActive = true
        
//        layoutIfNeeded()
        
        
        topBoxView.layer.mask = gradientLayer
        gradientLayer.add(shimmerAnimation, forKey: shimmerAnimation.keyPath)
    }
}
