//
//  Constants.swift
//  TransitionTaskiOS
//
//  Created by MacMini on 04/04/18.
//  Copyright © 2018 Noorul-MacBook. All rights reserved.
//

import Foundation
import UIKit

let screen_width = UIScreen.main.bounds.size.width
let screen_height = UIScreen.main.bounds.size.height
let defaults = UserDefaults.standard

//MARK:- CURRENT DATE
func generateCurrentDate() -> String
{
    let timeFormatter = DateFormatter()
    timeFormatter.timeZone = TimeZone.current
    timeFormatter.dateFormat = "dd-MM-yyyy"
    let str_date = "\(timeFormatter.string(from: Date()))"
    return str_date
}

func animation_images() -> NSMutableArray {
    let arr_images = NSMutableArray()
    for i in 1..<41 {
        let str_img_name = String(format: "buy_btn_%d", i)
        let img = UIImage(named: str_img_name)
        arr_images.add(img as Any)
    }
    return arr_images
}

func get_tshirts() -> NSMutableArray {
    let arr_tshirts = NSMutableArray()
    for i in 1...5 {
        let str_img_name = String(format: "t-shirt-%d", i)
        let img = UIImage(named: str_img_name)
        arr_tshirts.add(img as Any)
    }
    return arr_tshirts
}

func get_delivery_texts() -> NSMutableArray {
    let arr_texts = NSMutableArray()
    let arr_reverse = NSMutableArray()
    for i in 1...10 {
        arr_texts.add("Product delivered \(i) days")
    }
    for j in 0..<arr_texts.count {
        arr_reverse.add(arr_texts.object(at: (arr_texts.count-1)-j))
    }
    return arr_reverse
}

func reset_delivery_texts() -> NSMutableArray {
    let arr_texts = NSMutableArray()
    for i in 1...10 {
        arr_texts.add("Product delivered \(i) days")
    }
    return arr_texts
}

func RADIANS(radians: Int) -> CGFloat {
    return CGFloat(radians) * .pi / 180
}
