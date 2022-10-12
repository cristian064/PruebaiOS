//
//  ListViewController.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation
import UIKit
import GenericUtilities

class ListViewController: UIViewController {
    let presenter: ListViewPresenterProtocol
    
    private let collectionView: UICollectionView = {
        // Cell
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Define Group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 32
        
        let compositionLayout = UICollectionViewCompositionalLayout(section: section)
        return UICollectionView(frame: .zero, collectionViewLayout: compositionLayout)
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    init(presenter: ListViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigation()
        setupCollectionView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        title = presenter.title
//        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        collectionView.fillSuperview()
    }
    
    private func setupNavigation() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = .red
        return cell
    }
    
}


extension ListViewController: UISearchBarDelegate {
    
}

extension ListViewController: ListPresenterViewProtocol {
//    func didReceiveError() {
//        let alerView = UIAlertController(title: "Error", message: "Something happen", preferredStyle: .alert)
//        alerView.addAction(.init(title: "acept", style: .destructive))
//        self.present(alerView, animated: false, completion: nil)
//    }
}
