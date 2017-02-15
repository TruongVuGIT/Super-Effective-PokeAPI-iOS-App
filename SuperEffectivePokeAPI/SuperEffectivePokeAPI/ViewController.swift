//
//  ViewController.swift
//  SuperEffectivePokeAPI
//
//  Created by Truong Vu on 2/15/17.
//  Copyright © 2017 Truong Vu. All rights reserved.
//
// Refer to https://www.reddit.com/r/dailyprogrammer/comments/5961a5/20161024_challenge_289_easy_its_super_effective/
//
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var EffectivenessOutput: UILabel!
    @IBOutlet weak var attackInput: UITextField!
    @IBAction func CheckButton(_ sender: Any)
    {
        //Configure the URL to call the RESTFUL API
        var url = "https://pokeapi.co/api/v2/type/" + attackInput.text! + "/";
        //print(url);
        
        //Call the function
        callPokeAPI(url: url)
        
    }
    
    func callPokeAPI(url:String) -> String
    {
        //Create a URL session
        let url = NSURL(string: url)!
        let urlSess = URLSession.shared;
        
        //Create semaphore so that the UI updates after the restful service has been completed.
        let semaphore = DispatchSemaphore.init(value: 0);
        
        //Invoke the service and get the JSON data.
        let jsonQuery = urlSess.dataTask(with: url as URL, completionHandler: { data, response, error -> Void in
            if (error != nil)
            {
                print(error!.localizedDescription)
            }
            
            var err: NSError?
            var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil)
            {
                print("JSON Error \(err!.localizedDescription)")
            }
           
            
            
        //Parsing the JSON Data
            //self.EffectivenessOutput.text =
                print(jsonResult["name"] as! String)
            print("Hello");
        })
       
        
        jsonQuery.resume();
        
        
        return "Hello";
        
        }

}

