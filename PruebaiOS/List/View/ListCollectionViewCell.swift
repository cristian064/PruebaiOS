//
//  ListCollectionViewCell.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation
import UIKit
import GenericUtilities

class ListCollectionViewCell: UICollectionViewCell, ReuseIdentifier {
    
    let titleLabel = UILabel()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackView = UIStackView(arrangedSubviews: [
        titleLabel,
        descriptionLabel
    ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
    }
    
    private func setupConstraint() {
        stackView.fillSuperview()
    }
}

