//
//  ViewController.swift
//  TransitionTaskiOS
//
//  Created by MacMini on 04/04/18.
//  Copyright © 2018 Noorul-MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bg_img: UIImageView!
    @IBOutlet var lbl_title: UILabel!
    @IBOutlet var btn_Chk: UIButton!
    
    @IBOutlet var emoji_view: UIView!
    var open_emoji: Bool = false
    var frame_emoji:CGRect!
    @IBOutlet var emoji_title: UILabel!
    @IBOutlet var emoji_ico1: UIImageView!
    @IBOutlet var emoji_ico2: UIImageView!
    @IBOutlet var emoji_ico3: UIImageView!
    @IBOutlet var emoji_ico4: UIImageView!
    @IBOutlet var twts_title: UILabel!
    @IBOutlet var twts_img: UIImageView!
    
    @IBOutlet var product_view: UIView!
    var open_product: Bool = false
    var frame_product:CGRect!
    @IBOutlet var date_lbl: UILabel!
    @IBOutlet var product_buy_img: UIImageView!
    @IBOutlet var product_tshirt_img: UIImageView!
    @IBOutlet var deliver_date_lbl: UILabel!
    var clicked_buy:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        frame_emoji = emoji_view.frame
        frame_product = product_view.frame
        
        self.emoji_view.transform = CGAffineTransform(translationX: 0, y: 800)
        self.product_view.transform = CGAffineTransform(translationX: 0, y: 900)
        
        self.twts_title.alpha = 0.0
        self.twts_img.alpha = 0.0
        self.product_tshirt_img.alpha = 0.0
        
        open_emoji = false
        open_product = false
        
        date_lbl.text = generateCurrentDate()
        
        lbl_title.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 1.0, animations: {
            self.lbl_title.transform = CGAffineTransform.identity
        }, completion: { finshed in
            UIView.animate(withDuration: 0.4, animations: {
                self.emoji_view.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { finshed in
                UIView.animate(withDuration: 0.4, animations: {
                    self.product_view.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion:nil)
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_Transition(sender: UIButton) {
        self.start_wooble_animation()
    }
    
    func start_wooble_animation() {
        btn_Chk.transform = CGAffineTransform.init(rotationAngle: RADIANS(radians: -10))  // (-5, RADIANS(radians: -1))
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[.repeat,.allowUserInteraction,.autoreverse], animations: {
            self.btn_Chk.transform = CGAffineTransform(rotationAngle: RADIANS(radians: 0))
        }, completion: nil)
    }
    
    
    @IBAction func emojiSwipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up && open_emoji == false{
            self.emoji_ico1.transform = CGAffineTransform(translationX: 0, y: 260)
            self.emoji_ico2.transform = CGAffineTransform(translationX: 0, y: 260)
            self.emoji_ico3.transform = CGAffineTransform(translationX: 0, y: 260)
            self.emoji_ico4.transform = CGAffineTransform(translationX: 0, y: 260)
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.emoji_view.frame = CGRect(x: self.emoji_view.frame.origin.x, y: self.emoji_view.frame.origin.y-280.0, width: self.emoji_view.frame.size.width, height: self.emoji_view.frame.size.height)
                
                self.emoji_ico1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.emoji_ico2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.emoji_ico3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.emoji_ico4.transform = CGAffineTransform(translationX: 0, y: 0)
                
            }, completion: { finished in
                print("open the emoji view")
                self.open_emoji = true
                
                self.twts_title.alpha = 1.0
                self.twts_img.alpha = 1.0
                
                self.twts_title.transform = CGAffineTransform(translationX: 0, y: self.product_view.frame.size.height)
                self.twts_img.transform = CGAffineTransform(translationX: 0, y: self.product_view.frame.size.height)
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                    self.twts_title.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.twts_img.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion:nil)
            })
        }
        else if sender.direction == .down && open_emoji == true{
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.emoji_view.frame = self.frame_emoji
                self.twts_title.alpha = 0.0
                self.twts_img.alpha = 0.0
            }, completion: { finished in
                print("close the emoji view")
                self.open_emoji = false
            })
        }
        else {
            self.open_emoji = false
        }
    }
    
    @IBAction func productSwipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up && open_product == false{
            self.open_product = true
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.product_view.frame = CGRect(x: self.product_view.frame.origin.x, y: self.product_view.frame.origin.y-220.0, width: self.product_view.frame.size.width, height: self.product_view.frame.size.height)
            }, completion: { finished in
                print("open the product view")
                //self.product_tshirt_img.transform = CGAffineTransform(translationX: 0, y: self.product_view.frame.size.height)
                self.product_tshirt_img.alpha = 1.0
                let arr_tshirts = get_tshirts()
                self.product_tshirt_img.animationImages = arr_tshirts as? [UIImage]
                self.product_tshirt_img.animationDuration = 2.0
                self.product_tshirt_img.startAnimating()
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                    self.product_tshirt_img.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            })
        }
        else if sender.direction == .down && open_product == true{
            self.open_product = false
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.product_view.frame = self.frame_product
                self.product_tshirt_img.alpha = 0.0
            }, completion: { finished in
                print("close the product view")
                self.product_tshirt_img.stopAnimating()
            })
        }
        else {
            self.open_product = false
        }
    }
    
    @IBAction func buy_product(sender: UIButton) {
        if clicked_buy == false {
            clicked_buy = true
            
            let arr_txts = get_delivery_texts()
            show_animate_texts(arr_texts: arr_txts, current_id: 0)

            let arr_images = animation_images()
            product_buy_img.animationImages = arr_images as? [UIImage]
            product_buy_img.animationDuration = 2.0
            self.product_buy_img.startAnimating()
            sender.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                sender.isUserInteractionEnabled = true
                self.product_buy_img.stopAnimating()
                self.product_buy_img.image = arr_images.object(at: arr_images.count-1) as? UIImage
            }
        }
        else {
            clicked_buy = false
            
            let arr_txts = reset_delivery_texts()
            self.show_animate_texts(arr_texts: arr_txts, current_id: 0)

            let arr_images = animation_images()
            product_buy_img.animationImages = arr_images.reversed() as? [UIImage]
            product_buy_img.animationDuration = 2.0
            self.product_buy_img.startAnimating()
            sender.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                sender.isUserInteractionEnabled = true
                self.product_buy_img.stopAnimating()
                self.product_buy_img.image = arr_images.object(at: 0) as? UIImage
            }
        }
    }
    
    
    func show_animate_texts(arr_texts: NSMutableArray, current_id:Int) {
        DispatchQueue.main.async {
            self.deliver_date_lbl.text = "\(arr_texts.object(at: current_id))"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if arr_texts.count == current_id+1 {
                return
            }
            else {
                self.show_animate_texts(arr_texts: arr_texts, current_id: current_id+1)
            }
        }
    }
    
}

