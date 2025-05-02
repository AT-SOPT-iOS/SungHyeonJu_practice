//
//  ItemViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/26/25.
//
import UIKit

import SnapKit

final class ItemViewController: UIViewController, UICollectionViewDelegate {


    //MARK: - properites

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let itemData = ItemModel.dummy() //더미 데이터 주입

    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterLineSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right:
    20)
    final let carrotInterItemSpacing: CGFloat =  2


    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
        setDelegate()
    }


    //MARK: Private Method

    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func register() {
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }

    //MARK: - Action Methods
}

//MARK: - CollectionView Extension

extension ItemViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let screenWidth = UIScreen.main.bounds.width
              let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
              return CGSize(width: doubleCellWidth / 2, height: 198)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return carrotLineSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return carrotInterItemSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return carrotInset
  }

}


extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.row])
        return cell
    }
}
