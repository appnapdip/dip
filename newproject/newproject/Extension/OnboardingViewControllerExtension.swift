//
//  OnboardingViewControllerExtension.swift
//  newproject
//
//  Created by New User on 8/14/23.
//

import Foundation
import UIKit


// MARK: create extension of borading collectionViewController

extension collectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingmodels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CustomCell", for: indexPath) as! CustomCell
        let onboadingModel = onboardingmodels[indexPath.item]
        cell.onboardingimageView.image = onboadingModel.onboardingImage
        cell.onboardingTitle.text = onboadingModel.onboardingText
        cell.onboardingSubTitle.text = onboadingModel.onboradingSubTitle
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIdeviceSize.width, height:UIdeviceSize.height)
    }
    
    // pagescrolling section
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onboradinpageControll.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        currentcell = onboradinpageControll.currentPage
        print("scorllview \(currentcell)")
    }
    
}
