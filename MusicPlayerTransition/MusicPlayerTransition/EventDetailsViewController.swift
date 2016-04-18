//
//  EventDetailsViewController.swift
//  MusicPlayerTransition
//
//  Created by Valentina Coletti on 18/03/16.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import UIKit
import MapKit

final class EventDetailsViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
  
  var tapCloseButtonActionHandler : (Void -> Void)?
  @IBOutlet weak var navBar: UINavigationBar!
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    UIApplication.sharedApplication().statusBarStyle = .Default
    configureTableView()
//    configureNavBar()
  }

  func configureTableView() {
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 130.0
  }
  
  func configureNavBar() {
    navBar.barTintColor = UIColor.whiteColor()
    navBar.titleTextAttributes = [
      NSForegroundColorAttributeName : UIColor.blackColor(),
      NSFontAttributeName : UIFont(name: "Roboto-Regular", size: 16)!
    ]
  }
  
  @IBAction func tapCloseButton(sender: UIBarButtonItem) {
    self.tapCloseButtonActionHandler?()
    self.navigationController?.popViewControllerAnimated(true)
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
  }

  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("photosCell", forIndexPath: indexPath)
    return cell
  }
  
}
