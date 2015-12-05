//
//  ViewController.swift
//  MusicPlayer2
//
//  Created by Shapes on 13/11/2015.
//  Copyright © 2015 Shapes. All rights reserved.
//

//Imported libraries

import UIKit
import AVFoundation
import MediaPlayer

//Class declaration and extensions
class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    //Connecting sections of the main storyboard to the code
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!

    //Variables being declared
    var isPlaying = false
    var error = "Error"
    var picker1Options = [String]()
    
    //ViewDidLoad method.
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //Background mode for the app
        do{
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }catch{
            print(error)
        }
        
        //Importing the stations from the plist
        let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        //Adding them to the picker1Option array
        picker1Options = dict!.objectForKey("stations") as! [String]
        
        //Setting the default load image
        bgImage!.image = UIImage(named: "newviberadio.png")!
        self.trackPicker.delegate = self
        self.trackPicker.dataSource = self
    }
    
    //Calling a func for button presses to ultimately return isPlaying status
    @IBAction func buttonPressed(sender: AnyObject) {
        
        toggle()
    }
    
    //..which passes commands back to the RadioPlayer swift file to play/pause audio 
    //depending on what is currently active
    func toggle() {
        
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    //Playing audio and changing the image
    func playRadio() {
        
        RadioPlayer.sharedInstance.play()
        playButton.setImage(UIImage(named: "pause.png") , forState: UIControlState.Normal)
    }
    
    //Pausing radio and again changing the image
    func pauseRadio() {
        
        RadioPlayer.sharedInstance.pause()
        playButton.setImage(UIImage(named: "play.png") , forState: UIControlState.Normal)
    }
    
    //Number of components in the pickerview
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
    
    //Chaging the colour of the pickerview rows to black. (Had previously used an inversion of black and white.
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attributedString = NSAttributedString(string: "\(picker1Options[row])", attributes: [NSForegroundColorAttributeName : UIColor.blackColor()])
        return attributedString
    }
    
    // Capture the picker view selection, set the audio stream and image accordingly
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}