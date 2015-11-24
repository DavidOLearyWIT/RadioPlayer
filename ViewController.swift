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


class PopulationOfArrays {
    
    func artistValues() -> [String] {
        return ["Vibe", "Buddha Bar", "Chocolat", "100 Chill", "Chillout Classics", "Absolute Chillout", "Chill-One"]
    }
    
    func trackValues(selected: String) -> [String] {
        if selected == "Buddha Bar" {
            return ["http://listen.radionomy.com/buddha-bar"]
        }
        if selected == "Chocolat" {
            return ["http://listen.radionomy.com/chocolat-radio"]
        }
        if selected == "100 Chill" {
            return ["http://listen.radionomy.com/100-chill"]
        }
        if selected == "Chillout Classics" {
            return ["http://listen.radionomy.com/chillout-classics"]
        }
        if selected == "Absolute Chillout" {
            return ["http://listen.radionomy.com/absolutechillout"]
        }
        if selected == "Vibe" {
            return ["http://s22.myradiostream.com:9368/"]
        }
        else {
            return["http://listen.radionomy.com/chill-one"]
        }
    }
}

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var mainWebView: UIWebView!

    
    var isPlaying = false
    var error = "Error"
    var radioDictionary = [String: String]()
    var radioArray: [[String]] = [[String]]()
    var picker1Options:[String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        bgImage!.image = UIImage(named: "vibe.png")!
        playButton.setTitle("Play Radio", forState: UIControlState.Normal)
        self.trackPicker.delegate = self
        self.trackPicker.dataSource = self

        picker1Options = ["Vibe", "Buddha Bar", "Chocolat", "100 Chill", "Chillout Classics", "Absolute Chillout", "Chill-One"]
        let radioSortedKeys = Array(radioDictionary.keys).sort(<)
        radioArray = [radioSortedKeys,radioSortedKeys]
        
        for (var row=0;row<radioArray[0].count;row++){
            if (radioArray[0][row] == "Absolute Chillout"){
                trackPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
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
        playButton.setTitle("Radio Playing - Press To Pause", forState: UIControlState.Normal)
    }
    
    func pauseRadio() {
        
        RadioPlayer.sharedInstance.pause()
        playButton.setTitle("Press To Play Radio", forState: UIControlState.Normal)
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
        let attributedString = NSAttributedString(string: "\(picker1Options[row])", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        return attributedString
    }
    
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            
            if("\(picker1Options[row])" == "Buddha Bar")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/buddha-bar")!)
                bgImage!.image = UIImage(named: "buddhabar.png")!
            }
            if("\(picker1Options[row])" == "Chocolat")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chocolat-radio")!)
                bgImage!.image = UIImage(named: "Chocolat.png")!
            }
            if("\(picker1Options[row])" == "Chillout Classics")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chillout-classics")!)
                bgImage!.image = UIImage(named: "classics.png")!
            }
            if("\(picker1Options[row])" == "Absolute Chillout")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/absolutechillout")!)
                bgImage!.image = UIImage(named: "absolute.png")!
            }
            if("\(picker1Options[row])" == "Chill-One")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/chill-one")!)
                bgImage!.image = UIImage(named: "chillone.png")!
            }
            if("\(picker1Options[row])" == "100 Chill")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/100-chill")!)
                bgImage!.image = UIImage(named: "100Chill.png")!
            }
            if("\(picker1Options[row])" == "Vibe")
            {
                RadioPlayer.sharedInstance.player = AVPlayer(URL: NSURL(string: "http://s22.myradiostream.com:9368/")!)
                bgImage!.image = UIImage(named: "vibe.png")!
            }
        
            print( "\(RadioPlayer.sharedInstance.player)")
            print("\(picker1Options[row])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}