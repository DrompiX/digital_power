//
//  OnBoardingPageViewController.swift
//  Transcrypt
//
//  Created by Denis Zaplatnikov on 25/06/2018.
//  Copyright © 2018 Units. All rights reserved.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    private let pageImages = [#imageLiteral(resourceName: "phone"), #imageLiteral(resourceName: "eco")]

    private let pageTitles = ["Оплата штрафов и задолженностей",
                              "Отказ от бумажных постановлений"]

    private let pageTexts = ["",
                             "Используйте приложение - это просто, быстро и спасает лес"]

    private var currentIndex = 0
    private var pageControl: UIPageControl!

    var onBoardingChangePageDelegate: OnBoardingChangePageDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self

        // Install the first-presented view controller
        setViewControllers([viewControllerAtIndex(index: 0)!], direction: .forward, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var subviews = view.subviews
        for i in 0..<subviews.count {
            if subviews[i] is UIPageControl {
                pageControl = subviews[i] as? UIPageControl
                break
            }
        }
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.init(red: 41, green: 111, blue: 208, alpha: 1)
        updateDots()
    }

    public func navigateToNextPage() {
        guard let vc = viewControllerAtIndex(index: currentIndex + 1) else {
            return
        }
        currentIndex += 1
        onBoardingChangePageDelegate.onPageChanged()
        setViewControllers([vc], direction: .forward, animated: true)
    }

    public func isLastPage() -> Bool {
        return currentIndex == pageTitles.count - 1
    }

    private func viewControllerAtIndex(index: Int) -> OnBoardingPageContentViewController? {
        if index < 0 || index >= pageTitles.count {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let vc = storyboard?.instantiateViewController(withIdentifier: "OnBoardingPageContent") as! OnBoardingPageContentViewController
        vc.titleText = pageTitles[index]
        vc.content = pageTexts[index]
        vc.image = pageImages[index]
        vc.pageIndex = index

        return vc
    }

    private func updateDots() {
        for i in 0..<pageControl.subviews.count {
            let dot = pageControl.subviews[i]
            if i == pageControl.currentPage {
                dot.backgroundColor = UIColor.blue
            } else {
                dot.backgroundColor = UIColor.white
            }
            dot.layer.cornerRadius = dot.frame.size.height / 2
            dot.layer.borderColor = UIColor.black.cgColor
            dot.layer.borderWidth = 1
        }
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let vc = viewController as! OnBoardingPageContentViewController
        return viewControllerAtIndex(index: vc.pageIndex - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! OnBoardingPageContentViewController
        return viewControllerAtIndex(index: vc.pageIndex + 1)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageTexts.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if completed {
            guard let vc = viewControllers?.last as? OnBoardingPageContentViewController else {
                return
            }
            updateDots()
            currentIndex = vc.pageIndex
            onBoardingChangePageDelegate.onPageChanged()
        }
    }
}
