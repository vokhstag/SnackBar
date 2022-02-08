//
//  SnackBar.swift
//  SnackBar
//
//  Created by Yunus Abubakarov on 08.02.2022.
//

import UIKit

class SnackBar: UIView {
    // MARK: - Model
    private let viewModel: SnackBarModel
    // MARK: - UI
    private let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        self.subView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        self.subView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Constructor 🏗
    init(viewModel: SnackBarModel,
         frame: CGRect = CGRect()) {
        self.viewModel = viewModel
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuure
private extension SnackBar {
    func configure() {
        setupSubView()
        setupStackView()
        configureStackViews()
    }
    func setupSubView() {
        addSubview(subView)
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    func setupStackView() {
        subView.addSubview(horizontalStackView)
        let topConstant: CGFloat = (verticalStackView.subviews.count == 2) ? 12 : 16
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 12),
            horizontalStackView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -12),
            horizontalStackView.topAnchor.constraint(equalTo: subView.topAnchor, constant: topConstant),
            horizontalStackView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -16)
        ])
    }
    func configureStackViews() {
        if let icon = viewModel.icon {
            horizontalStackView.addArrangedSubview(iconImageView)
            iconImageView.image = icon
        }
        verticalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(verticalStackView)
        titleLabel.text = viewModel.title
        if let buttonType = viewModel.buttonType {
            actionButton.setTitle(viewModel.buttonTitle, for: .normal)
            if buttonType == .short {
                horizontalStackView.addArrangedSubview(actionButton)
            } else {
                verticalStackView.addArrangedSubview(actionButton)
            }
        }
    }
}
