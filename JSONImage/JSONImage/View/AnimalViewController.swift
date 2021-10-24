//
//  AnimalViewController.swift
//  JSONImage
//
//  Created by Field Employee on 10/24/21.
//

import UIKit

class AnimalViewController: UIViewController {

    var animalName: String = ""
    var animalImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        view.backgroundColor = .white
        
        let animalNamelabel = UILabel()
        animalNamelabel.frame = CGRect(x: 20, y: 0, width: 100, height: 20)
        animalNamelabel.text = animalName
        animalNamelabel.textAlignment = .left
        view.addSubview(animalNamelabel)
        
        let imageUrlString = animalImage
        guard let imageUrl:URL = URL(string: imageUrlString) else {
            return
        }
        
        // Start background thread so that image loading does not make app unresponsive
        
        DispatchQueue.global().async { [weak self] in guard let self = self else { return }
        guard let imageData = try? Data(contentsOf: imageUrl) else {
            return
        }
            let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
            imageView.center = self.view.center
                    
            // When from a background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                imageView.image = image
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                self.view.addSubview(imageView)
            }
        }
        self.view = view
    }
    
}
