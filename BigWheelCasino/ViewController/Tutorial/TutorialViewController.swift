//
//  TutorialViewController.swift
//  BigWheelCasino
//
//  Created by Apple on 14/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    
    
    var arrHomeCollection = [OnBoardingDataModel]()
    var timer: Timer?
    var currentIndex = 0
    let automaticScrollDuration: TimeInterval = 3.0
    
    //MARK:- View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setData()
        pageController.numberOfPages = arrHomeCollection.count
        btnNext.setTitle("NEXT", for: .normal)

    }
    
    func setData() {
        arrHomeCollection.append(OnBoardingDataModel(img: "onboarding_artwork_1", title: "Title 1", subTitle: "Lorem Ipsum? Lorem Ipsum has been the industry's standard dummy text"))
        arrHomeCollection.append(OnBoardingDataModel(img: "onboarding_artwork_1", title: "Title 2", subTitle: "Lorem Ipsum? Lorem Ipsum has been the industry's standard dummy text"))
        arrHomeCollection.append(OnBoardingDataModel(img: "onboarding_artwork_3", title: "Title 3", subTitle: "Lorem Ipsum? Lorem Ipsum has been the industry's standard dummy text"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // startTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadDataInMain()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //stopTimer()
    }
    
    //MARK:- Methods
    func updatePage(pageIndex: Int) {
        self.pageController.currentPage = pageIndex
        if pageIndex == 0 {
                   btnNext.setTitle("NEXT", for: .normal)
               }else if pageIndex == 1 {
                   btnNext.setTitle("NEXT", for: .normal)
               }else {
                   btnNext.setTitle("START", for: .normal)
               }
    }
    
    func startTimer() {
        if let timer = self.timer {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: automaticScrollDuration, target: self, selector: #selector(updateCollectionScroll), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if let timer = self.timer {
            timer.invalidate()
        }
        self.timer = nil
    }
    
    @objc func updateCollectionScroll() {
        currentIndex += 1
        if currentIndex >= arrHomeCollection.count {
            currentIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath.init(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        updatePage(pageIndex: currentIndex)
    }
    
    //MARK:- Button Action
    @IBAction func actionNext(_ sender: Any){
        if btnNext.currentTitle == "START" {
            let vc = ForgetPasswordViewController.instance(.authentication) as! ForgetPasswordViewController
            self.navigationController?.setViewControllers([vc], animated: false)
        }else {
            print("not open home screen")
        }
    }
}

//MARK:- Scroll View Delegate
extension TutorialViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let xyz = scrollView.contentOffset.x / scrollView.frame.size.width
        let pageIndex: Int = Int(xyz)
        currentIndex = pageIndex
        self.updatePage(pageIndex: pageIndex)
    }
}

//MARK:- Collection View Delegate / Data Source
extension TutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //pageControl.numberOfPages = arrHomeCollection.count
        //pageControl.isHidden = !(arrHomeCollection.count > 1)
        return arrHomeCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TutorialCollectionViewCell.self), for: indexPath) as! TutorialCollectionViewCell
        cell.lblTitle.text = arrHomeCollection[indexPath.row].title
        cell.lblSubTitle.text = arrHomeCollection[indexPath.row].subTitle
        cell.imgBoarding.image = UIImage(named: arrHomeCollection[indexPath.row].img)
        return cell
    }
}

//MARK:-  UICollectionViewDelegate
extension TutorialViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK:-  UICollectionViewFlowDelegate
extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width , height: collectionView.frame.size.height)
    }
}

struct OnBoardingDataModel {
    var img: String
    var title: String
    var subTitle: String
    
}
