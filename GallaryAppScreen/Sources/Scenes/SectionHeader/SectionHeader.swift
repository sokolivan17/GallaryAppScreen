//
//  SectionHeader.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    static let identifier = "SectionHeader"

    let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()

    var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .link
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()

    override func prepareForReuse() {
        title.text = nil
        button.setTitle(nil, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel

        let stackViewTitleButton = UIStackView(arrangedSubviews: [title,button])
        stackViewTitleButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewTitleButton.axis = .horizontal
        stackViewTitleButton.isLayoutMarginsRelativeArrangement = true
        stackViewTitleButton.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

        let stackView = UIStackView(arrangedSubviews: [separator, stackViewTitleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.setCustomSpacing(10, after: separator)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
