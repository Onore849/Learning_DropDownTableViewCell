//
//  HeaderView.swift
//  expandTableViewCell
//
//  Created by 野澤拓己 on 2020/09/18.
//

import UIKit

protocol HeaderDelegate : AnyObject {
    func cellHeader(idx: Int)
}

class HeaderView: UIView {
    
    public var secIndex: Int?
    public weak var delegate: HeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(button )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
       let button = UIButton()
        
        button.frame = CGRect(
            x: self.frame.origin.x,
            y: self.frame.origin.y,
            width: self.frame.width,
            height: self.frame.height
        )
        
        button.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc private func onClickHeaderView() {
        
        if let idx = secIndex {
            delegate?.cellHeader(idx: idx)
        }
    }
}
