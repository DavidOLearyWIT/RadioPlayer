//
//  ViewController.swift
//  MusicPlayer2
//
//  Created by Shapes on 13/11/2015.
//  Copyright © 2015 Shapes. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import EZAudioiOS


class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, EZMicrophoneDelegate {
    
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var audioplot: EZAudioPlot!

    var isPlaying = false
    var error = "Error"
    var picker1Options = [String]()
    var microphone: EZMicrophone!;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        do{
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }catch{
            print(error)
        }
        
        let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        picker1Options = dict!.objectForKey("stations") as! [String]
        
        bgImage!.image = UIImage(named: "newviberadio.png")!
        self.trackPicker.delegate = self
        self.trackPicker.dataSource = self
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        toggle()
    }
    
    func toggle() {
        
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    func playRadio() {
        
        RadioPlayer.sharedInstance.play()
        playButton.setImage(UIImage(named: "pause.png") , forState: UIControlState.Normal)
    }
    
    func pauseRadio() {
        
        RadioPlayer.sharedInstance.pause()
        playButton.setImage(UIImage(named: "play.png") , forState: UIControlState.Normal)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return picker1Options.count
    }
    
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            return "\(picker1Options[row])"
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(picker1Options[row])", attributes: [NSForegroundColorAttributeName : UIColor.blackColor()])
        return attributedString
    }
    
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            
            if("\(picker1Options[row])" == "Buddha Bar")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/buddha-bar")!)
                bgImage!.image = UIImage(named: "newbuddhabar.png")!
            }
            if("\(picker1Options[row])" == "Chocolat")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chocolat-radio")!)
                bgImage!.image = UIImage(named: "newchocolat.png")!
            }
            if("\(picker1Options[row])" == "Chill Classics")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chillout-classics")!)
                bgImage!.image = UIImage(named: "newclassics.png")!
            }
            if("\(picker1Options[row])" == "Absolute Chillout")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/absolutechillout")!)
                bgImage!.image = UIImage(named: "newabsolute.png")!
            }
            if("\(picker1Options[row])" == "Chill One")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chill-one")!)
                bgImage!.image = UIImage(named: "newchillone.png")!
            }
            if("\(picker1Options[row])" == "Vibe")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://s22.myradiostream.com:9368/")!)
                bgImage!.image = UIImage(named: "newviberadio.png")!
            }
        print("\(picker1Options[row])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}