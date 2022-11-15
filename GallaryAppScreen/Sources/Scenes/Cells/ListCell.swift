//
//  ListCell.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    static let identifier: String = "ListCell"

    let iconContainer = UIView()

    let icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let name: UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()

    let countPhotos: UILabel = {
        let label =  UILabel()
        label.textAlignment = .right
        label.tintColor = .secondaryLabel

        return label
    }()

    let disclosureIndicator: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .secondaryLabel
        return image
    }()

    let separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        return separator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        iconContainer.addSubview(icon)

        let stackViewText = UIStackView(arrangedSubviews: [name, countPhotos, disclosureIndicator])
        stackViewText.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackViewText)
        stackViewText.alignment = .center
        stackViewText.axis = .horizontal
        stackViewText.spacing = UIStackView.spacingUseSystem
        stackViewText.isLayoutMarginsRelativeArrangement = true
        stackViewText.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)

        let stackViewWithSeparator = UIStackView(arrangedSubviews: [stackViewText, separator])
        stackViewWithSeparator.translatesAutoresizingMaskIntoConstraints = false
        stackViewWithSeparator.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [iconContainer, stackViewWithSeparator])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            iconContainer.widthAnchor.constraint(equalTo: heightAnchor),

            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor, constant: -5),
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),

            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

func configure(with cell: AnyCell, lastCell: Bool = false) {
        icon.image = UIImage(systemName: cell.image)
        name.text = cell.name
        countPhotos.text = String(cell.counterPhotos)
        separator.isHidden = lastCell
    }
}
