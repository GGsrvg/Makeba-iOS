//
//  DiagramCircleView.swift
//  makeba
//
//  Created by GGsrvg on 06.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

struct DiogramItem {
    let text: String
    let color: UIColor
    let numberVotes: UInt
}

@IBDesignable class DiagramCircleView: UIView {
    private var items: [DiogramItem] = []
    
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
        
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = (min(rect.width, rect.height) - 16) / 2
        var allNumberVotes: UInt = 0
        self.items.forEach {
            allNumberVotes += $0.numberVotes
        }
        print(items.count)
        
        var startPercent: CGFloat = 0
        self.items.forEach {
            let endPercent: CGFloat = CGFloat($0.numberVotes) / CGFloat(allNumberVotes) * 100 + startPercent
            drawSlice(startPercent: startPercent, endPercent: endPercent, color: $0.color, center: center, radius: radius)
            let label = UILabel()
            self.addSubview(label)
            label.text = $0.text
            label.sizeToFit()
            
            let mediumPercent = ((endPercent - startPercent) / 2.0) + startPercent
            let angle: CGFloat = self.angle(percent: mediumPercent)
            let angleDegrees = abs(angle) * 180 / .pi
            let radiusForLabel = radius + 4
            
            var x: CGFloat = (radiusForLabel * cos(angle)) + center.x
            var y: CGFloat = (radiusForLabel * sin(angle)) + center.y
            
            let frame = label.frame
            
            if angleDegrees >= 0 && angleDegrees < 90 {
            } else if angleDegrees >= 90 && angleDegrees < 180 {
                x -= frame.width
            } else if angleDegrees >= 180 && angleDegrees < 270 {
                x -= frame.width
                y -= frame.height
            } else {
                y -= frame.height
            }
            
            label.frame.origin = .init(x: x, y: y)
            
            print("Title: \($0.text)")
            print("Angle: \(angleDegrees)")
            
            startPercent = endPercent
        }
    }
    
    func drawSlice(startPercent: CGFloat, endPercent: CGFloat, color: UIColor, center: CGPoint, radius: CGFloat) {
        let startAngle: CGFloat = angle(percent: startPercent)
        let endAngle: CGFloat = angle(percent: endPercent)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        path.stroke()
        color.setFill()
        path.fill()
    }
    
    func clear() {
        items = []
    }
    
    func addItem(_ item: DiogramItem) {
        items.append(item)
        setNeedsDisplay()
    }
    
    private func angle(percent: CGFloat) -> CGFloat {
        return (percent * 3.6) * .pi / 180
    }
}
