//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Fareed Ahammad on 28/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(OnButtonTap), for: .touchUpInside)
        randomImage()
    }
    
    let colors: [UIColor] = [
        .systemPink,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemGray,
        .systemCyan
    ]
    
    @objc func OnButtonTap(){
        randomImage()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom , width: view.frame.size.width-60, height: 55)
    }
    
    func randomImage(){
        let link = "https://source.unsplash.com/random/600x600"
        let url = URL(string: link)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

