//
//  ViewController.swift
//  SwipeGesture
//
//  Created by SO YOUNG on 2018. 1. 6..
//  Copyright © 2018년 SO YOUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let numOfTouchs = 2
    
    //이미지뷰 변수 추가
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    //이미지 배열 선언
    var imgLeft = [#imageLiteral(resourceName: "arrow-left-black"), #imageLiteral(resourceName: "arrow-left-red"), #imageLiteral(resourceName: "arrow-left-green")]
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    let directions: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //이미지 배열에 이미지 할당
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
//        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
//        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
//        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        //각 이미지 뷰에 이미지 할당
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
       
        //제스처 등록
        for direction in directions {
            for numOfTouch in 1...2 {
                let gesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
                gesture.direction = direction
                gesture.numberOfTouchesRequired = numOfTouch
                self.view.addGestureRecognizer(gesture)
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //액션 메서드 구현
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer { //만일 제스처가 있으면
            //이미지 검은색 화살표로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction { //switch문을 사용해 제스처의 방향에 따라 해당 방향의 이미지를 빨간색 이미지로 변경
            case UISwipeGestureRecognizerDirection.up:
                imgViewUp.image = imgUp[swipeGesture.numberOfTouches]
            case UISwipeGestureRecognizerDirection.down:
                imgViewDown.image = imgDown[swipeGesture.numberOfTouches]
            case UISwipeGestureRecognizerDirection.left:
                imgViewLeft.image = imgLeft[swipeGesture.numberOfTouches]
            case UISwipeGestureRecognizerDirection.right:
                imgViewRight.image = imgRight[swipeGesture.numberOfTouches]
            default:
                break
            }
        }
    }

}
