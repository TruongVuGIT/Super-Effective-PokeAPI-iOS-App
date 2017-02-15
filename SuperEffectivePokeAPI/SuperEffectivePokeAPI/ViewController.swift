//
//  ViewController.swift
//  SuperEffectivePokeAPI
//
//  Created by Truong Vu on 2/15/17.
//  Copyright © 2017 Truong Vu. All rights reserved.
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
    @IBAction func CheckButton(_ sender: Any) {
        
        
        
        var url = "https://pokeapi.co/api/v2/type/" + attackInput.text! + "/";
        print(url);
        
        callPokeAPI(url: url)
        
    }
    
    func callPokeAPI(url:String) -> String
    {
        
        let url = NSURL(string: url)!
        let urlSess = URLSession.shared;
        let semaphore = DispatchSemaphore.init(value: 0);
        
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
            
            //self.EffectivenessOutput.text =
                print(jsonResult["name"] as! String)
            print("Hello");
        })
        
        jsonQuery.resume();
        
        
        return "Hello";
        
        }

}

