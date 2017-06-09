//
//  GoodButton.swift
//  GoodAnimaton
//
//  Created by LeoTai on 17/6/9.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit

class GoodButton: UIButton {
   
    //MARK: - property Setting && Getting 
    open var goodImg: UIImage? {
        set {
            bangView?.particleImg = goodImg;
        }
        get {
            return bangView?.particleImg;
        }
        
    }
    open var goodScale: CGFloat? {
        set {
            bangView?.particleScale = goodScale;
        }
        get {
            return bangView?.particleScale;
        }
    }
    open var goodScaleRange: CGFloat? {
        set {
            bangView?.particleScaleRange = goodScaleRange;
        }
        get {
            return bangView?.particleScaleRange;
        }
    }
    
    var bangView: BangView?;
    
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
        bangView?.frame = self.bounds;
        self.insertSubview(bangView!, at: 0);
    }
    
    //MARK: - private
    private func setUp() -> Void {
        self.clipsToBounds = false;
        bangView = BangView();
        self.insertSubview(bangView!, at: 0);
    }
    
}

//MARK: - public Method
extension GoodButton {
    
    public func animation() -> Void {
        bangView?.animate();
    }
    
    public func popOutsideWithDuration(duration: TimeInterval) -> Void {
        self.transform = CGAffineTransform.identity;
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: UIViewKeyframeAnimationOptions.layoutSubviews, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3.0, animations: { 
                [unowned self] in
                self.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0);
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1 / 3.0, relativeDuration: 1 / 3.0, animations: {
                self.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8);
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2 / 3.0, relativeDuration: 2 / 3.0, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0);
            })
            
        }) { (finished) in
            
        }
        
    }
    
    public func popInsideWithDuration(duration: TimeInterval) -> Void {
        self.transform = CGAffineTransform.identity;
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: UIViewKeyframeAnimationOptions.layoutSubviews, animations: { 
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 2.0, animations: {
                self.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7);
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 2.0, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0);
            })
        }) { (finished) in
            
        }
    }
    
}





