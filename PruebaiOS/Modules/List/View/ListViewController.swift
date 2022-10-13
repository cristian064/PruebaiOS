//
//  ListViewController.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    let presenter: ListPresenterProtocol
    var refreshControl: UIRefreshControl = .init(frame: .zero)
    var searchTimer : Timer?
    
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
    init(presenter: ListPresenterProtocol) {
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
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(update), for: .valueChanged)
        collectionView.prefetchDataSource = self
    }
    @objc func update() {
        presenter.initialLoadData()
    }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.data = self.presenter.elements[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(at: indexPath.row)
    }
}


extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        self.searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {[weak self] (_) in
            self?.presenter.search(with: searchText)
        })
    }
}

extension ListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let indexPathsSorted = indexPaths.sorted(by: {$0.row > $1.row})
        guard let first = indexPathsSorted.first else { return}
        presenter.willDisplay(indexPath: first)
    }
}

extension ListViewController: ListViewProtocol {
    func didReceiveData() {
        self.collectionView.reloadData()
    }
    func loading(with isLoading: Bool) {
        if !isLoading {
            self.refreshControl.endRefreshing()
        }
    }
}
