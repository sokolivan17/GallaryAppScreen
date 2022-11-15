//
//  ViewController.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {

    private let cellGroups = ModelData.getCells()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupDelegate()
        setupNavigation()
    }

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.register(ScrollCell.self, forCellWithReuseIdentifier: ScrollCell.identifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
    }

    private func setupDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setupNavigation() {
        navigationItem.title = TabNames.albumsName
        navigationController?.navigationBar.prefersLargeTitles = true

        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        navigationItem.leftBarButtonItem = button
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            let albumGroup = self.cellGroups[sectionIndex]

            switch albumGroup.type {
            case .secondRow:
                return self.createSecondSection()
            case .firstRow:
                return self.createFirstSection()
            case .list:
                return self.createThirdSection()
            }
        }
        return layout
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellGroups.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellGroups[section].cellsInGroup.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let data =  cellGroups[indexPath.section].type

        switch data.self {
        case .firstRow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCell.identifier, for: indexPath) as! ScrollCell
            let section = cellGroups[indexPath.section]
            let item = section.cellsInGroup[indexPath.item]
            cell.configure(with: item)
            return cell
        case .secondRow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCell.identifier, for: indexPath) as! ScrollCell
            let section = cellGroups[indexPath.section]
            let item = section.cellsInGroup[indexPath.item]
            cell.configure(with: item)
            return cell
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
            let section = cellGroups[indexPath.section]
            let item = section.cellsInGroup[indexPath.item]
            cell.configure(with: item, lastCell: indexPath.item == (section.cellsInGroup.count - 1) )
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let data =  cellGroups[indexPath.section].type

        switch data.self {
        case .firstRow:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            let section = cellGroups[indexPath.section]
            let item = section.headersInGroup[indexPath.item]
            header.title.text = item.header
            if let buttonText = item.titleButton {
                header.button.setTitle(buttonText, for: .normal)
            }
            return header
        case .secondRow:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            let section = cellGroups[indexPath.section]
            let item = section.headersInGroup[indexPath.item]
            header.title.text = item.header
            if let buttonText = item.titleButton {
                header.button.setTitle(buttonText, for: .normal)
            }
            return header
        case .list:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            let section = cellGroups[indexPath.section]
            let item = section.headersInGroup[indexPath.item]
            header.title.text = item.header
            if let buttonText = item.titleButton {
                header.button.setTitle(buttonText, for: .normal)
            }
            return header
        }
    }
}

