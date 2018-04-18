//
//  ViewControllerScroll.swift
//  Proyecto_Final
//
//  Created by Daniela Diaz on 4/18/18.
//  Copyright © 2018 Daniela Diaz. All rights reserved.
//

import UIKit
import AVKit

class ViewControllerScroll: UIViewController, UIScrollViewDelegate {

    //Intento hacer que cada imagen tenga zoom
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var imgD: UIImageView!
    @IBOutlet weak var imgE: UIImageView!
    @IBOutlet weak var imgF: UIImageView!
    @IBOutlet weak var imgG: UIImageView!
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgI: UIImageView!
    @IBOutlet weak var imgL: UIImageView!
    @IBOutlet weak var imgM: UIImageView!
    @IBOutlet weak var imgN: UIImageView!
    @IBOutlet weak var imgO: UIImageView!
    @IBOutlet weak var imgP: UIImageView!
    @IBOutlet weak var imgR: UIImageView!
    @IBOutlet weak var imgS: UIImageView!
    @IBOutlet weak var imgT: UIImageView!
    @IBOutlet weak var imgU: UIImageView!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var imgW: UIImageView!
    @IBOutlet weak var imgY: UIImageView!
    
   
    //Reproduce el video J
    @IBAction func btJ(_sender : Any){
        //Voy a sacar el path del video que puse
        if let path = Bundle.main.path(forResource: "j", ofType: "mp4"){
            let videoJ = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayerJ = AVPlayerViewController()
            videoPlayerJ.player = videoJ
            
            present(videoPlayerJ, animated: true, completion: {
              videoJ.play()
            })
        }
    }
    
    //Reproduce el video K
    @IBAction func btK(_ sender: Any) {
        if let path2 = Bundle.main.path(forResource: "k", ofType: "mp4"){
            let videoK = AVPlayer(url: URL(fileURLWithPath : path2))
            let videoPlayerK = AVPlayerViewController()
            videoPlayerK.player = videoK
            
            present(videoPlayerK, animated: true, completion: {
                videoK.play()
            })
        }
    }
    
    //Reproduce el video Q
    @IBAction func btQ(_ sender: Any) {
        if let path3 = Bundle.main.path(forResource: "q", ofType: "mp4"){
            let videoQ = AVPlayer(url: URL(fileURLWithPath : path3))
            let videoPlayerQ = AVPlayerViewController()
            videoPlayerQ.player = videoQ
            
            present(videoPlayerQ, animated: true, completion: {
                videoQ.play()
            })
        }
    }
    
    //Reproduce el video X
    @IBAction func btX(_ sender: Any) {
        if let path4 = Bundle.main.path(forResource: "x", ofType: "mp4"){
            let videoX = AVPlayer(url: URL(fileURLWithPath : path4))
            let videoPlayerX = AVPlayerViewController()
            videoPlayerX.player = videoX
            
            present(videoPlayerX, animated: true, completion: {
                videoX.play()
            })
        }
    }
    
    //Reproduce el video Z
    @IBAction func btZ(_ sender: Any) {
        if let path5 = Bundle.main.path(forResource: "z", ofType: "mp4"){
            let videoZ = AVPlayer(url: URL(fileURLWithPath : path5))
            let videoPlayerZ = AVPlayerViewController()
            videoPlayerZ.player = videoZ
            
            present(videoPlayerZ, animated: true, completion: {
                videoZ.play()
            })
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imgA
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
