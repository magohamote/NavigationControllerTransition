//
//  ModalViewController.swift
//  MusicPlayerTransition
//
//  Created by xxxAIRINxxx on 2015/02/25.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit

final class ModalViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
  var tapCloseButtonActionHandler : (Void -> Void)?
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var navBar: UINavigationBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    UIApplication.sharedApplication().statusBarStyle = .Default
    configureTableView()
    configureNavBar()
  }
  
  func configureTableView() {
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 130.0
  }
  
  func configureNavBar() {
    navBar.barTintColor = UIColor.whiteColor()

  }
  
  @IBAction func tapCloseButton(sender: UIBarButtonItem) {
    self.tapCloseButtonActionHandler?()
    self.dismissViewControllerAnimated(true, completion: nil)
  }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("ModalViewController viewWillAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        print("ModalViewController viewWillDisappear")
    }
  
  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("futureEventCell", forIndexPath: indexPath)
    return cell
  }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EventDetailsViewController") as! EventDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
