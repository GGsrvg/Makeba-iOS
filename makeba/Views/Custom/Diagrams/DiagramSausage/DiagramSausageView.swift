//
//  DiagramSausageView.swift
//  makeba
//
//  Created by GGsrvg on 13.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import UIKit

@IBDesignable class DiagramSausageView: UIView {
    
    private let typeCollectionViewCell = "\(TypeCollectionViewCell.self)"
    
    private var items: [DiagramItem] = []
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let cvfl = UICollectionViewFlowLayout()
        cvfl.scrollDirection = .horizontal
        // TODO: dynamic width
        cvfl.itemSize = .init(width: 150, height: 40)
        return cvfl
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: typeCollectionViewCell, bundle: .main), forCellWithReuseIdentifier: typeCollectionViewCell)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        self.addItem(.init(text: "C++",     color: .systemYellow,   numberVotes: 10))
        self.addItem(.init(text: "C",       color: .systemGreen,    numberVotes: 40))
        self.addItem(.init(text: "C#",      color: .systemOrange,   numberVotes: 30))
        self.addItem(.init(text: "Java",    color: .systemPurple,   numberVotes: 20))
        self.addItem(.init(text: "Swift",   color: .systemPink,     numberVotes: 20))
    }
    
    override func draw(_ rect: CGRect) {
        let fullWidth = rect.width
        let fullHeight = rect.height - 40
        var allNumberVotes: CGFloat = 0
        self.items.forEach {
            allNumberVotes += CGFloat($0.numberVotes)
        }
        
        var continueX: CGFloat = 0
        
        items.forEach { item in
            let width = fullWidth * CGFloat(item.numberVotes) / allNumberVotes
            defer {
                continueX += width
            }
            
            let path = UIBezierPath(rect: .init(x: continueX, y: 0, width: width, height: fullHeight))
            item.color.setFill()
            path.fill()
        }
    }
    
    func clear() {
        items = []
        collectionView.reloadData()
    }
    
    func addItem(_ item: DiagramItem) {
        items.append(item)
        setNeedsDisplay()
        collectionView.reloadData()
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension DiagramSausageView: UICollectionViewDelegate, UICollectionViewDataSource { //}, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = items.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: typeCollectionViewCell, for: indexPath) as! TypeCollectionViewCell
        cell.typeColor.backgroundColor = item.color
        cell.label.text = item.text
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: typeCollectionViewCell, for: indexPath) as! TypeCollectionViewCell
//        let size = cell.systemLayoutSizeFitting(.init(width: 0, height: 40))
//        return size
//    }
}
