//
//  DetailViewController.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    let presenter: DetailViewPresenterProtocol
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label

    }()
    
    lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, UIView()])
    
    init(presenter: DetailViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
        setupData()
    }
    
    func setupData() {
        title = presenter.title
        titleLabel.text = presenter.data.title
        descriptionLabel.text = presenter.data.body
    }
    
    func setupView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        view.backgroundColor = .white
    }

    func setupConstraints() {
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor)
    }
}
