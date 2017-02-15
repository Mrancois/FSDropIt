//
//  FSDropIt.swift
//  FSDropIt
//
//  Created by Francois Devove on 15.02.17.
//  Copyright © 2017 Francois Devove. All rights reserved.
//

import Foundation
import UIKit

class FSDropIt: UIView {
    public var isShown: Bool!
    public var items: [AnyObject]!
    
    public var x: CGFloat
    public var y: CGFloat
    public var width: CGFloat
    public var heightBtn: CGFloat
    public var heightView: CGFloat
    
    var button : UIButton!
    var tableview = FSDropItTableView(items: nil, frame: CGRect())
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(items: [AnyObject], x:CGFloat, y:CGFloat, width: CGFloat, heightBtn: CGFloat, heightView: CGFloat) {
        self.isShown = false
        self.items = items
        
        self.x = x
        self.y = x
        self.width = width
        self.heightBtn = heightBtn
        self.heightView = heightView
        
        super.init(frame: CGRect(x: x, y: x, width: width, height: heightBtn + heightView))
        button = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: heightBtn))
        let frame2 = CGRect(x: 0, y: heightBtn, width: width, height: heightView)
        button.backgroundColor = UIColor.red
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchDown)
        self.addSubview(button)
        button.tag = 3
        tableview = FSDropItTableView(items: items as [AnyObject], frame: frame2)
        tableview.tag = 2
        tableview.isHidden = true
        self.addSubview(tableview)
    }
    
    func pressButton() {
        if (self.viewWithTag(2)?.isHidden)! {
            tableview.alpha = 0.0
            self.viewWithTag(2)?.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.tableview.alpha = 1.0
            }, completion: nil)
        } else {
            self.viewWithTag(2)?.isHidden = true
        }
    }
    
    func changeTextButton(texte:String){
        button.setTitle(texte, for: .normal)
    }
    
    func setTableviewBackgroundColor(color : UIColor!){
        tableview.backgroundColor = color
    }
    
    func setButtonBackgroundColor(color : UIColor!){
        button.backgroundColor = color
    }
    
    func setButtonBorder(borderWidth:Float, borderColor : UIColor){
        button.layer.borderWidth = CGFloat(borderWidth)
        button.layer.borderColor = borderColor.cgColor
    }
    
    func setTableviewBorder(borderWidth:Float, borderColor : UIColor){
        tableview.layer.borderWidth = CGFloat(borderWidth)
        tableview.layer.borderColor = borderColor.cgColor
    }
    
    func getButtonText() -> String {
        return (button.titleLabel?.text)!
    }
    
}

class FSDropItTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private var items: [AnyObject]!
    private var selectedIndexPath: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init not implement")
    }
    
    init(items: [AnyObject]?, frame: CGRect) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        
        self.items = items
        
        self.delegate = self
        self.dataSource = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn : UIButton = self.superview!.viewWithTag(3) as! UIButton
        btn.setTitle(items[indexPath.row] as? String, for: .normal)
        self.viewWithTag(2)?.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
