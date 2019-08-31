//
//  ViewController.swift
//  TablExpand
//
//  Created by Anil Kumar on 04/09/18.
//  Copyright © 2018 Anil Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  
  @IBOutlet weak var tableview: UITableView!
//  fileprivate var dataArray = Array<Any>()
//  private var dataArray1 = Array<Any>()
//  var data : [String] = []
  var countriesinEurope = ["France","Spain","Germany"]
  var countriesinFrance = ["Japan","China","India","Nepal"]
  var countriesinArgentia = ["Argentia","Brasil","Chile","India"]
  var countriesingulf = ["behrain","soudi","Dubai","sarja"]
  var arrayHeader = [1,1,1,1]
  
  override func viewDidLoad() {
    
//    print("\(Thread.isMainThread)")
    MemoryAlertController.sharedInstance.presentCustomAlert(title: "", message: "Very Simple Expand Collapse UITableView Swift")
    
    tableview.delegate = self
    tableview.dataSource = self
    super.viewDidLoad()
  }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return arrayHeader.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    print("\(section)")
    print(self.arrayHeader[section])
    
    switch section {
    case 0:
      if self.arrayHeader[section] == 0 {
        return 0
      }else{
        return countriesinEurope.count
      }
    case 1:
      if self.arrayHeader[section] == 0 {
        return 0
      }else{
        return countriesinFrance.count
      }
    case 2:
      if self.arrayHeader[section] == 0 {
        return 0
      }else{
        return countriesinArgentia.count
      }
    case 3:
      if self.arrayHeader[section] == 0 {
        return 0
      }else{
        return countriesingulf.count
      }
    default:
      if self.arrayHeader[section] == 0 {
        return 0
      }else{
        return countriesingulf.count
      }
    }
    
    
//    if section == 0 {
//      return 0
//    }else if section == 1 {
//      return countriesinEurope.count
//    }else if section == 2 {
//      return countriesinFrance.count
//    }else if section == 3 {
//      return countriesinArgentia.count
//    }
//
//    return (self.arrayHeader[section] == 0) ? 0 : 4

//    switch arrayHeader[section] {
//    case 0:
//      return 0
//    case 1:
//      return countriesinEurope.count
//    case 2:
//      return countriesinFrance.count
//    case 3:
//      return countriesinArgentia.count
//    default:
//      return 0
//    }
//
    
//    return (self.arrayHeader[section] == 0) ? 0 : 4
    // return 3
//    switch section {
//    case 0:
//      return countriesinEurope.count
//    case 1:
//      return countriesinFrance.count
//    case 2:
//      return countriesinArgentia.count
//    default:
//      return 0
//    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    var cell : TableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
//
//    if cell == nil {
//      cell = TableViewCell(style: .default, reuseIdentifier: "cell")
//    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
//    if indexPath.section == 0 {
//      cell.textLabel?.text = countriesingulf[indexPath.row]//"section: \(indexPath.section)  row: \(indexPath.row)"
//    }else if indexPath.section == 1 {
//      cell.textLabel?.text = countriesinArgentia[indexPath.row]//"section: \(indexPath.section)  row: \(indexPath.row)"
//    }else{
//      cell.textLabel?.text = countriesingulf[indexPath.row]//"section: \(indexPath.section)  row: \(indexPath.row)"
//    }
    
//    return cell
    
//    cell?.data.text = "section: \(indexPath.section)  row: \(indexPath.row)"

    switch indexPath.section {
    case 0 :
      cell.textLabel?.text = countriesinEurope[indexPath.row]
    case 1 :
      cell.textLabel?.text = countriesinFrance[indexPath.row]
    case 2 :
      cell.textLabel?.text = countriesinArgentia[indexPath.row]
    case 3 :
      cell.textLabel?.text = countriesingulf[indexPath.row]
    default:
      cell.textLabel?.text = "Other"
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
    viewHeader.backgroundColor = UIColor.darkGray // Changing the header background color to gray
    let button = UIButton(type: .custom)
    button.frame = viewHeader.bounds
    button.tag = section // Assign section tag to this button
    button.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
    button.setTitle("Section: \(section)", for: .normal)
    viewHeader.addSubview(button)
    return viewHeader
    
//    var headerCell: TableViewCell1? = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? TableViewCell1
//
//    if headerCell == nil {
//      headerCell = TableViewCell1(style: .default, reuseIdentifier: "HeaderCell")
//    }
//
//    headerCell?.backgroundColor = UIColor.darkGray
//    headerCell?.delegate = self
////    headerCell?.textLabel?.textColor = UIColor.black
////    headerCell?.textLabel?.textAlignment = .center
//    headerCell?.button.tag = section // Assign section tag to this button
//    headerCell?.button.setTitle("Section: \(section)", for: .normal)
    
//    switch (section) {
//    case 0:
//      headerCell.headerCell.text = "Europe";
//    case 1:
//      headerCell.headerCell.text = "Asia";
//    case 2:
//      headerCell.headerCell.text = "South America";
//    default:
//      headerCell.headerCell.text = "Other";
//    }
//    return headerCell
  }
  
  @objc func tapSection(sender: UIButton) {
    
    arrayHeader[sender.tag] = (arrayHeader[sender.tag] == 0) ? 1 : 0
    
    print(arrayHeader[sender.tag])
    
    tableview.reloadSections([sender.tag], with: .fade)
  }

  
  
  
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! TableViewCell1
//    switch (section) {
//    case 0:
//      headerCell.headerCell.text = "Europe";
//      return "Europe"
//    case 1:
//      headerCell.headerCell.text = "Asia";
//      return "Asia"
//    case 2:
//      headerCell.headerCell.text = "South America";
//      return "South America"
//    default:
//      headerCell.headerCell.text = "Other";
//      return ""
//    }
//  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    switch indexPath.section {
//    case 0:
//      print(countriesinEurope[indexPath.row])
//    case 1:
//      print(countriesinFrance[indexPath.row])
//    case 2:
//      print(countriesinArgentia[indexPath.row])
//    default:
//      print("")
//    }
//  }
}

final class MemoryAlertController {
  private static var privateSharedInstance: MemoryAlertController?
  static var sharedInstance: MemoryAlertController {
    if privateSharedInstance == nil {
      privateSharedInstance = MemoryAlertController()
    }
    return privateSharedInstance!
  }
  class func destroy() {
    privateSharedInstance = nil
  }
  var customAlertView:UIView = UIView()
  var backgroundView = UIView()
  var customFont = "Arial"
  
  
  func presentCustomAlert(title:String,message:String) {
    if let window = UIApplication.shared.delegate!.window {
      customAlertView.backgroundColor = UIColor().hexStringToUIColor(hex: "F7F7F7")
      customAlertView.layer.cornerRadius = 15
      let alertViewWidth = (window?.frame.width)!-64
      
      
      backgroundView.frame = (window?.frame)!
      backgroundView.backgroundColor = UIColor.black
      backgroundView.alpha = 0.6
      window?.addSubview(backgroundView)
      
      // Title label is used for displaying the alert title.
      let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: alertViewWidth-16, height: 30))
      titleLabel.text = title
      titleLabel.font = UIFont(name: customFont, size: 20)
      titleLabel.textAlignment = .center
      customAlertView.addSubview(titleLabel)
      
      // separatorLineView is used for highlighting a small line between the title and the message.
      let separatorLineView = UIView()
      separatorLineView.frame.origin = CGPoint(x: 0, y: titleLabel.frame.height + 8)
      separatorLineView.frame.size = CGSize(width: (window?.frame.size.width)! - 50, height: 1)
      separatorLineView.backgroundColor = UIColor.groupTableViewBackground
      customAlertView.addSubview(separatorLineView)
      
      // Title label is used for displaying the alert title.
      let messageLabel = UILabel(frame: CGRect(x: 18, y: separatorLineView.frame.origin.y + 20, width: alertViewWidth-16, height: heightForView(text: message, font: UIFont(name: customFont, size: 14)!, width: alertViewWidth-16)))
      messageLabel.text = message
      messageLabel.font = UIFont(name: customFont, size: 14)
      messageLabel.numberOfLines = 20
      messageLabel.textAlignment = .center
      messageLabel.adjustsFontSizeToFitWidth = true
      customAlertView.addSubview(messageLabel)
      
      // bottomSeparatorLineView is used for highlighting a small line between the message and the button.
      let bottomSeparatorLineView = UIView()
      bottomSeparatorLineView.frame.origin = CGPoint(x: 0, y: messageLabel.frame.origin.y + messageLabel.frame.size.height + 15)
      bottomSeparatorLineView.frame.size = CGSize(width: (window?.frame.size.width)! - 50, height: 1)
      bottomSeparatorLineView.backgroundColor = UIColor.groupTableViewBackground
      customAlertView.addSubview(bottomSeparatorLineView)
      
      let dismissButton = UIButton(frame: CGRect(x: 8, y: bottomSeparatorLineView.frame.origin.y + bottomSeparatorLineView.frame.size.height, width: alertViewWidth-16, height: 40))
      dismissButton.setTitle("OK", for: .normal)
      dismissButton.titleLabel?.font = UIFont(name: customFont, size: 18)
      dismissButton.setTitleColor(UIColor.blue, for: .normal)
      dismissButton.addTarget(self, action: #selector(dismissAlertView), for: .touchUpInside)
      customAlertView.addSubview(dismissButton)
      
      let height = titleLabel.frame.height + messageLabel.frame.height + dismissButton.frame.height + 45
      customAlertView.frame = CGRect(x: 0, y: 0, width: (window?.frame.size.width)! - 50, height:height)
      customAlertView.center = window!.center
      window?.addSubview(customAlertView)
    }
  }
  
  func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.height
  }
  
  @objc func dismissAlertView() {
    DispatchQueue.main.async() { [weak self] () -> Void in
      self?.customAlertView.removeFromSuperview()
      self?.backgroundView.removeFromSuperview()
      MemoryAlertController.destroy()
    }
}
}


extension UIColor{
  func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}
