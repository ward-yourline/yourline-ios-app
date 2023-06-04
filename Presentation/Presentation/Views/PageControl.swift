//
//  PageControl.swift
//  Presentation
//
//  Created by Warrd Adlani on 04/06/2023.
//

import Foundation
import UIKit
import SwiftUI

public struct PageControl : UIViewRepresentable {
    
    private var currentPageIndex : Int = 0
    private var numberOfPages : Int = 0
    private var indicatorColor: UIColor
    private var currentPageIndicatorTintColor: UIColor
    
    public init(currentPageIndex: Int = 0, numberOfPages: Int = 0, indicatorColor: UIColor = .gray, currentPageIndicatorTintColor: UIColor = .black) {
        self.currentPageIndex = currentPageIndex
        self.numberOfPages = numberOfPages
        self.indicatorColor = indicatorColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
    }
    
    /// Create UIView object and configure the initial state
    /// - Returns: UIPageControl
    public func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        
        pageControl.pageIndicatorTintColor = indicatorColor
        pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        pageControl.numberOfPages = numberOfPages
        
        return pageControl
    }
    
    /// Update the state of UIKit view based on new info given from SwiftUI
    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
}
