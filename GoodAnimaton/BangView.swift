//
//  BangView.swift
//  GoodAnimaton
//
//  Created by LeoTai on 17/6/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class BangView: UIView {
    
    //MARK: - property && Setting
    
    open var particleImg: UIImage? {
        willSet{
            explosionCell?.contents = particleImg?.cgImage;
        }
    }
    open var particleScale: CGFloat? {
        willSet {
            explosionCell?.scale = particleScale ?? 0;
        }
    }
    open var particleScaleRange: CGFloat? {
        willSet {
            explosionCell?.scaleRange = particleScaleRange ?? 0;
        }
    }
    
    
    var center_bangeView: CGPoint?
    var explosionLayer: CAEmitterLayer?
    var explosionCell: CAEmitterCell?
    var animation: CABasicAnimation?
    
    //MARK: - override
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUp();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.setUp();
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        center_bangeView = CGPoint(x: self.bounds.midX, y: self.bounds.midY);
        explosionLayer?.emitterPosition = center_bangeView!;
    }
    
    //MARK: - private Method
    private func setUp() -> Void {
        self.clipsToBounds = true;
        self.isUserInteractionEnabled = false;
        
        explosionCell = CAEmitterCell();
        explosionCell?.name = "explosion";
        explosionCell?.alphaRange = 0.2;
        explosionCell?.alphaSpeed = -0.1;
        explosionCell?.lifetime = 0.7;
        explosionCell?.lifetimeRange = 0.3;
        explosionCell?.birthRate = 0.1;
        explosionCell?.velocity = 40;
        explosionCell?.velocityRange = 10;
        
        explosionLayer = CAEmitterLayer();
        explosionLayer?.name = "emitterLayer";
        explosionLayer?.emitterShape = kCAEmitterLayerCircle;
        explosionLayer?.emitterMode = kCAEmitterLayerOutline;
        explosionLayer?.emitterSize = CGSize(width: 25, height: 0);
        explosionLayer?.emitterCells = [explosionCell!];
        explosionLayer?.renderMode = kCAEmitterLayerOldestFirst;
        explosionLayer?.masksToBounds = false;
        self.layer.addSublayer(explosionLayer!);
        
    }
 
}
//MARK: - public Method
extension BangView {
    
    public func animate() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            [unowned self] in
            self.explosionLayer?.beginTime = CACurrentMediaTime();
            self.animation = CABasicAnimation(keyPath: "emitterCells.explosion.birthRate");
            self.animation?.fromValue = 0;
            self.animation?.toValue = 500;
            self.explosionLayer?.add(self.animation!, forKey: nil);
        }
    }
    
    
    
}
