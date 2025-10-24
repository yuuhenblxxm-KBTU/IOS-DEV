//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Macbook Air on 23.10.2025.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!

    let flowers: [(image: String, description: String)] = [
        ("rose", "A timeless symbol of love and beauty."),
        ("sunflower", "Always turning toward the sun."),
        ("tulip", "Elegant flower of spring."),
        ("orchid", "Exotic and graceful blossom."),
        ("lily", "Represents purity and devotion."),
        ("daisy", "Simple, cheerful, and bright."),
        ("cherry_blossom", "Delicate sign of renewal."),
        ("lavender", "Calm and aromatic flower."),
        ("peony", "Symbol of prosperity and honor."),
        ("iris", "A flower of hope and inspiration.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        randomizeFlower()
    }
    
    private func setupUI() {
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.layer.cornerRadius = 12
        itemImageView.clipsToBounds = true
        itemTitleLabel.textAlignment = .center
        itemDescriptionLabel.textAlignment = .center
        itemDescriptionLabel.numberOfLines = 0
    }

    private func randomizeFlower() {
        guard let randomFlower = flowers.randomElement() else { return }
        itemImageView.image = UIImage(named: randomFlower.image)
        itemTitleLabel.text = randomFlower.image.capitalized.replacingOccurrences(of: "_", with: " ")
        itemDescriptionLabel.text = randomFlower.description
    }
    
    @IBAction func randomizeButtonTap(_ sender: UIButton) {
        randomizeFlower()
    }
}
