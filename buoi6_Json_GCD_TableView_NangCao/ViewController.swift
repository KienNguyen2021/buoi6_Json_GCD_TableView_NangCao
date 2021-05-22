//
//  ViewController.swift
//  buoi6_Json_GCD_TableView_NangCao
//
//  Created by Kien Nguyen on 2021-05-21.
//

// Dispatch, also known as Grand Central Dispatch (GCD), contains language features, runtime libraries

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
     
    // links for 3 pics :
    //https://hinhanhdephd.com/wp-content/uploads/2016/03/hinh-anh-bien-dep-Sea-wallpaper-10.jpg
    //https://i.pinimg.com/564x/16/5c/de/165cde7ef607294d514dc34b8a09a819.jpg
    //https://i.pinimg.com/564x/97/a3/bf/97a3bffb0883697aaed34d89dc86e9de.jpg
    
    
    @IBAction func LOADHINH(_ sender: Any) {
        LOADHINH_TRUYENTHONG(url: "https://hinhanhdephd.com/wp-content/uploads/2016/03/hinh-anh-bien-dep-Sea-wallpaper-10.jpg", img: img1)
        
        LOADHINH_TRUYENTHONG(url: "https://i.pinimg.com/564x/16/5c/de/165cde7ef607294d514dc34b8a09a819.jpg", img: img2)
        
        
        LOADHINH_TRUYENTHONG(url: "https://i.pinimg.com/564x/97/a3/bf/97a3bffb0883697aaed34d89dc86e9de.jpg", img: img3)
    }
    
    // Use DispatchQueue to load 3 pictures, faster loading :
    
    func LOADHINH_GCD(url :String, img:UIImageView){
        
        let q = DispatchQueue(label: "loadhinh")
        q.async {
        
            let u = URL(string: url)
            do{
                  let data = try Data(contentsOf:u!)
                
                // Phai put luong Main  vo day no moi work :
                  
                DispatchQueue.main.async {
                
                      img.image = UIImage(data :data)
                  }
          }catch{}
        }
    }
    
    func LOADHINH_TRUYENTHONG(url :String, img:UIImageView){
        let u = URL(string: url)
        do{
            let data = try Data(contentsOf:u!)
            img.image = UIImage(data :data)
        }catch{}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

