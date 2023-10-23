//
//  ViewController.swift
//  OS_Alfa_Second
//
//  Created by Нелли Першина on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . systemBlue
        let url: URL = URL(string:"https://lichess.org/api")!
                URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
                    guard
                        let data = data,
                            error == nil
                    else{
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let model = try! decoder.decode([LichessDTO].self, from: data)
                    print(model)
                }).resume()
            }


        }

        struct LichessDTO: Decodable{
            let id: Int
            let name: String
            let tagline: String
            let imageUrl: URL
        }



