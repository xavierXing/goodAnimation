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
        self.configFireworks();
//        self.view.backgroundColor = UIColor.yellow;
//        goodBtn.center = self.view.center;
//        self.view.addSubview(self.goodBtn);

    }

    func configFireworks()  {
        let fireworksEmitter = CAEmitterLayer()
        let viewBounds = self.view.layer.bounds
        fireworksEmitter.emitterPosition = CGPoint.init(x: viewBounds.size.width/2.0, y: viewBounds.size.height)
        fireworksEmitter.emitterSize	 = CGSize.init(width: 1, height: 0.0)
        fireworksEmitter.emitterMode	 = kCAEmitterLayerOutline
        fireworksEmitter.emitterShape	 = kCAEmitterLayerLine // 定义类型 发射的类型，呈 线状
        fireworksEmitter.renderMode		 = kCAEmitterLayerAdditive
        
        
        let rocket = CAEmitterCell()
        rocket.birthRate        = 6.0 // 发射速率
        rocket.emissionRange    = (CGFloat.pi * 0.2)
        rocket.velocity			= 280 // 速度
        rocket.velocityRange	= 50 // 速度范围
        rocket.yAcceleration	= 0
        rocket.lifetime			= 2.02	// we cannot set the birthrate < 1.0 for the burst
        
        rocket.contents			= UIImage.init(named: "scale")?.cgImage
        
        rocket.scale			= 0.2 // 半径
        
        rocket.greenRange		= 1.0		// different colors
        rocket.redRange			= 1.0
        rocket.blueRange		= 1.0
        
        rocket.spinRange		= CGFloat.pi // slow spin
        
        // the burst object cannot be seen, but will spawn the sparks
        // we change the color here, since the sparks inherit its value
        let burst = CAEmitterCell()
        
        burst.birthRate			= 0.5		// 什么时候爆开
        burst.velocity			= 0
        burst.scale				= 2.5
        burst.redSpeed			= -1.5		// shifting 颜色变化速率
        burst.blueSpeed			= +1.5		// shifting
        burst.greenSpeed		= +1.0		// shifting
        burst.lifetime			= 0.35
        
        // and finally, the sparks
        let spark = CAEmitterCell()
        
        spark.birthRate			= 666
        spark.velocity			= 125
        spark.emissionRange		= 2 * CGFloat.pi	// 360 deg
        spark.yAcceleration		= 75		// gravity
        spark.lifetime			= 3
        
        spark.contents			= UIImage.init(named: "scale")?.cgImage
        spark.scale		        = 0.5
        spark.scaleSpeed		= -0.2
        spark.greenSpeed		= -0.1
        spark.redSpeed			= 0.4
        spark.blueSpeed			= -0.1
        spark.alphaSpeed		= -0.5
        spark.spin				= 2 * CGFloat.pi
        spark.spinRange			= 2 * CGFloat.pi
        
        fireworksEmitter.emitterCells = Array.init(arrayLiteral: burst)
//        rocket.emitterCells           = Array.init(arrayLiteral: burst)
        burst.emitterCells            = Array.init(arrayLiteral: spark)
        self.view.layer.addSublayer(fireworksEmitter)
    }
    
    
}

