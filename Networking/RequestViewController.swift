//
//  RequestViewController.swift
//  Networking
//
//  Created by Ruslan on 10/27/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {

    @IBOutlet weak var downloadImageButton: UIButton!
    @IBOutlet weak var getRequestButton: UIButton!
    @IBOutlet weak var postRequestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    @IBAction func downloadAction(_ sender: Any) {
    }
    @IBAction func getAction(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard
                let response = response,
                let data = data
            else { return }
            print(response)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    @IBAction func postAction(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let userData = ["Course":"Networking", "Lesson":"GET and POST Requests"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else { return }
            print(response)
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
