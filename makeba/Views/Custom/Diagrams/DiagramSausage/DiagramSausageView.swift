//
//  DiagramSausageView.swift
//  makeba
//
//  Created by GGsrvg on 13.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import UIKit

@IBDesignable class DiagramSausageView: UIView {
    
    private var items: [DiagramItem] = []
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    override func prepareForInterfaceBuilder() {
        self.addItem(.init(text: "C++",     color: .systemYellow,   numberVotes: 10))
        self.addItem(.init(text: "C",       color: .systemGreen,    numberVotes: 40))
        self.addItem(.init(text: "C#",      color: .systemOrange,   numberVotes: 30))
        self.addItem(.init(text: "Java",    color: .systemPurple,   numberVotes: 20))
        self.addItem(.init(text: "Swift",   color: .systemPink,     numberVotes: 20))
    }
    
    override func draw(_ rect: CGRect) {
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        let fullWidth = rect.width
        let fullHeight = rect.height
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
            path.stroke()
            item.color.setFill()
            path.fill()
        }
    }
    
    func clear() {
        items = []
    }
    
    func addItem(_ item: DiagramItem) {
        items.append(item)
        setNeedsDisplay()
    }
}
