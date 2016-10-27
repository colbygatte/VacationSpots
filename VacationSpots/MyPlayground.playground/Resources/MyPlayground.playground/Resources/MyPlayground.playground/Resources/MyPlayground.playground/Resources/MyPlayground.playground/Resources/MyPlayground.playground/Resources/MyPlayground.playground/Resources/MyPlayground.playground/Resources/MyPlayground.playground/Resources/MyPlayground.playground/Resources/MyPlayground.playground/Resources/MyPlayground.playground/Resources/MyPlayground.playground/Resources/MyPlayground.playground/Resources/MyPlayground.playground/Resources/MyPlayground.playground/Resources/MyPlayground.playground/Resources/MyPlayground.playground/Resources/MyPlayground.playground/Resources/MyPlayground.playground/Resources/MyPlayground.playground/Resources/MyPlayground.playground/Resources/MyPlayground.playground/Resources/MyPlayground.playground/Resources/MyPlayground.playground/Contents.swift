//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var imgSrc = "bread.jpg"
var img = UIImage(named: imgSrc)
var imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
imgView.image = img


var v = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 500))
v.backgroundColor = UIColor.white
v.addSubview(imgView)

PlaygroundPage.current.liveView = v