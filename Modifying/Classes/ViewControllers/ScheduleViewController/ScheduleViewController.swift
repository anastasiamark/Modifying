//
//  ScheduleViewController.swift
//  Modifying
//
//  Created by Eugenity on 31.10.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var timeScheduleContainerView: UIView!
    @IBOutlet weak var scheduleSegmentedControl: UISegmentedControl!
    
    private let dailyScheduleVC = IntervalScheduleViewController()
    private let weeklyScheduleVC = IntervalScheduleViewController()
    private let monthlyScheduleVC = IntervalScheduleViewController()
    private let timeScheduleVC = IntervalScheduleViewController()
    
    private var visibleContentVC: IntervalScheduleViewController? {
        didSet {
            switch scheduleSegmentedControl.selectedSegmentIndex {
            case 0:
                visibleContentVC = dailyScheduleVC
            case 1:
                visibleContentVC = weeklyScheduleVC
            case 2:
                visibleContentVC = monthlyScheduleVC
            default:
                print("ScheduleViewController| Default segmented index: \(scheduleSegmentedControl.selectedSegmentIndex)")
            }
        }
    }
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(createActiveGoal)), animated: true)
        configureChildVCs()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: Actions
    @IBAction func segmantedContolAction(_ sender: UISegmentedControl) {
        
        switch scheduleSegmentedControl.selectedSegmentIndex {
        case 0:
            print("ScheduleViewController| DAILY")
            displayContentController(content: dailyScheduleVC, for: containerView)
        case 1:
            print("ScheduleViewController| WEEKLY")
            displayContentController(content: weeklyScheduleVC, for: containerView)
        case 2:
            print("ScheduleViewController| MONTHLY")
            displayContentController(content: monthlyScheduleVC, for: containerView)
        default:
            print("ScheduleViewController| DEFAULT")
        }
        
        self.visibleContentVC?.collectionView.reloadData()
    }
    
    //MARK: Private Functions
    @objc private func createActiveGoal() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func displayContentController(content: IntervalScheduleViewController, for container: UIView) {
        if let visibleContentVC = visibleContentVC, container == containerView {
            hideContentController(content: visibleContentVC)
        }
        addChildViewController(content)
        content.view.frame = container.bounds
        container.addSubview(content.view)
        content.didMove(toParentViewController: self)
        visibleContentVC = content
    }
    
    private func hideContentController(content: UIViewController) {
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    private func configureChildVCs() {
        dailyScheduleVC.configureVCWith(.daily)
        weeklyScheduleVC.configureVCWith(.weekly)
        monthlyScheduleVC.configureVCWith(.monthly)
        timeScheduleVC.configureVCWith(.partOfDay)
        visibleContentVC = IntervalScheduleViewController()
        displayContentController(content: visibleContentVC!, for: containerView)
        displayContentController(content: timeScheduleVC, for: timeScheduleContainerView)
    }
    
    /*
    private let mainScheduleView: MainScheduleView = MainScheduleView.instanceFromNib() as! MainScheduleView
    private func addViewsToContainerViews() {
        if !firstContainerView.subviews.contains(mainScheduleView) {
            firstContainerView.addSubview(mainScheduleView)
            mainScheduleView.frame = firstContainerView.bounds
        }
    }*/

}
