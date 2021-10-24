//
//  ViewController.swift
//  JSONImage
//
//  Created by Field Employee on 10/20/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myTableView: UITableView = UITableView()
    //var itemsToLoad: [String] = ["Apple", "Amazon", "Google"]
    var animal:[Animal]? = nil
    var animalData: AnimalNetworkManager = AnimalNetworkManager()
    var indexAt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadDataOnView()
        // self.view.backgroundColor = .darkGray
        // Do any additional setup after loading the view.
    }
        
    func setupUI() {
        self.view.addSubview(myTableView)
        myTableView.dataSource = self
        myTableView.delegate = self
        let customNib = UINib(nibName: "AnimalCell", bundle: nil)
        myTableView.register(customNib, forCellReuseIdentifier: "AnimalCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func loadDataOnView() {
        animalData.getAnimals(completionHandler: {(_animalData) in
            if(_animalData?.animals != nil) {
                self.animal = _animalData?.animals
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return itemsToLoad.count
        return self.animal?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        //cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        let animalObj = self.animal?[indexPath.row]
        let somethingName = animalObj?.name
        cell.animalName.text = somethingName
        
        let animalImageUrl = URL(string: (animalObj?.image)!)!
        let animalImageData = try? Data(contentsOf: animalImageUrl)
        cell.animalImage.image = UIImage(data: animalImageData!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = self.animal?[indexPath.row]
        let nextPage = AnimalViewController()
        nextPage.animalName = animal!.name
        nextPage.animalImage = animal!.image
            
        present(nextPage, animated: true, completion: nil)
    }
}

