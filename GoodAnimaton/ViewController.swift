//
//  ViewController.swift
//  GoodAnimaton
//
//  Created by 邢浩 on 2017/6/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var goodBtn: GoodButton = {
        let goodBtn = GoodButton.init(type: UIButtonType.custom);
        goodBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 60);
        goodBtn.goodImg = UIImage(named: "scale");
        goodBtn.goodScale = 0.05;
        goodBtn.goodScaleRange = 0.02;
        goodBtn.addTarget(self, action: #selector(clickEvent(btn:)), for: UIControlEvents.touchUpInside);
        goodBtn.setImage(UIImage(named: "like2_normal_icon"), for: .normal);
        goodBtn.setImage(UIImage(named: "like2_seclected_icon"), for: .selected)
        return goodBtn;
    }()
    
    func clickEvent(btn: GoodButton) -> Void {
        if btn.isSelected {
            btn.popInsideWithDuration(duration: 0.4);
        } else {
            btn.popOutsideWithDuration(duration: 0.5);
            btn.animation();
        }
        btn.isSelected = !btn.isSelected;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        goodBtn.center = self.view.center;
        self.view.addSubview(self.goodBtn);

    }
}

