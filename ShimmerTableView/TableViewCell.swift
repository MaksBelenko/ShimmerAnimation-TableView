//
//  TableViewCell.swift
//  ShimmerTableView
//
//  Created by Maksim on 25/07/2020.
//  Copyright © 2020 Maksim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    private let bottomBoxColor = UIColor.bottomGray

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
        animation.duration = 1
        return animation
    }()
    
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    // MARK: - Configure cell method
    func configureShimmer(width: CGFloat, height: CGFloat) {
        configureNameBox()
    }
    
    
    // MARK: - Configure UI
    
    private func configureNameBox() {
        let nameBox = getBottomView()
        addSubview(nameBox)
        nameBox.translatesAutoresizingMaskIntoConstraints = false
        nameBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        nameBox.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        nameBox.heightAnchor.constraint(equalToConstant: 19).isActive = true
        addTopBox(for: nameBox)
        
        let dateBox = getBottomView()
        addSubview(dateBox)
        dateBox.translatesAutoresizingMaskIntoConstraints = false
        dateBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        dateBox.topAnchor.constraint(equalTo: nameBox.bottomAnchor, constant: 5).isActive = true
        dateBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        dateBox.heightAnchor.constraint(equalToConstant: 13).isActive = true
        addTopBox(for: dateBox)
        
        
        let priceBox = getBottomView()
        addSubview(priceBox)
        priceBox.translatesAutoresizingMaskIntoConstraints = false
        priceBox.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        priceBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        priceBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        priceBox.heightAnchor.constraint(equalToConstant: 22).isActive = true
        addTopBox(for: priceBox)
        
    }
    
    private func getBottomView() -> UIView {
        let view = UIView()
        view.backgroundColor = bottomBoxColor
        return view
    }
    
    //MARK: - Helpers
    
    private func addTopBox(for bottomView: UIView) {
        let view = UIView()
        view.backgroundColor = .shimmerGray
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: bottomView.heightAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: bottomView.widthAnchor).isActive = true

        addShimmerMask(to: view)
    }


    private func addShimmerMask(to view: UIView) {
        let gradLayer = createGradientLayer()
        view.layer.mask = gradLayer
        gradLayer.add(shimmerAnimation, forKey: shimmerAnimation.keyPath)
    }
    
    
    func createGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.shimmerGray.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        return gradientLayer
    }
}
