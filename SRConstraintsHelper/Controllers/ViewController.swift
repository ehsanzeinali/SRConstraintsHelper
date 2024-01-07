//
//  ViewController.swift
//  SRConstraintsHelper
//
//  Created by Siamak Rostami on 1/5/24.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    // MARK: Internal

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }

    // MARK: Private

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .newyork
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        button.setTitle("Navigate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let action = UIAction { [weak self] action in
            let stackVC = StackViewController()
            self?.present(stackVC, animated: true, completion: nil)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
}

extension ViewController {
    private func layoutView() {
        SRConstraintBuilder.shared
            .addSubviewTo(containerView: view, view: imageView)
            .addSubviewTo(containerView: view, view: descriptionLabel)
            .addSubviewTo(containerView: view, view: button)
            .createConstraint(type: .top, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .top, multiplier: 1, constant: 0)
            .createConstraint(type: .centerX, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 1, constant: 0)
            .createConstraint(type: .height, item: imageView, relatedBy: .equal, toItem: imageView, attributeTo: .width, multiplier: 9 / 16, constant: 0)
            .createConstraint(type: .top, item: descriptionLabel, relatedBy: .equal, toItem: imageView, attributeTo: .bottom, multiplier: 1, constant: 16)
            .createConstraint(type: .centerX, item: descriptionLabel, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: descriptionLabel, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 0.9, constant: 0)
            .createConstraint(type: .centerX, item: button, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: button, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 0.9, constant: 0)
            .createConstraint(type: .bottom, item: button, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attributeTo: .bottom, multiplier: 1, constant: -16)
            .createConstraint(type: .height, item: button, relatedBy: .equal, toItem: nil, attributeTo: .notAnAttribute, multiplier: 1, constant: 48)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SRConstraintBuilder.shared.updateConstraint(type: .height, view: self.button, constant: 100)
        }
    }
}
