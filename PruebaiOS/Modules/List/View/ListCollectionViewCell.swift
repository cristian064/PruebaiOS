//
//  ListCollectionViewCell.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation
import UIKit

class ListCollectionViewCell: UICollectionViewCell, ReuseIdentifier {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var data: DataModel! {
        didSet {
            titleLabel.text = data.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.borderWidth = 1
        self.contentView.backgroundColor = .gray
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraint() {
        titleLabel.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
}

