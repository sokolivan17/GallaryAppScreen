//
//  Extensions.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import UIKit

extension ViewController {

    func createFirstSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 15)

        let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
        topItem.contentInsets = contentInset

        let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
        bottomItem.contentInsets = contentInset

        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Metric.sizeAlbumItemWidth), heightDimension: .absolute(Metric.sizeAlbumItemHeight)),
            subitems: [topItem, bottomItem]
        )

        let section = NSCollectionLayoutSection(group: nestedGroup)
        section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [self.createLayoutSectionHeader()]

        return section
    }

    func createSecondSection() -> NSCollectionLayoutSection  {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 15)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Metric.sizeAlbumItemWidth), heightDimension: .absolute(Metric.sizeAlbumItemHeight / 2)),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [self.createLayoutSectionHeader()]
        return section

    }

    func createThirdSection() -> NSCollectionLayoutSection  {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(Metric.sizeListHeight)),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
        section.boundarySupplementaryItems = [self.createLayoutSectionHeader()]

        return section

    }

    func createLayoutSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(Metric.sizeListHeight))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }

    enum Metric {
        static let sizeAlbumItemWidth: CGFloat = 190
        static let sizeAlbumItemHeight: CGFloat = 500
        static let sizeListHeight: CGFloat = 50
    }
}
