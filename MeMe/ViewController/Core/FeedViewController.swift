//
//  FeedViewController.swift
//  MeMe
//
//  Created by 권정근 on 12/19/24.
//

import UIKit
import PhotosUI

class FeedViewController: UIViewController {
    
    // MARK: - Variables
    var userMemo: [Memo] = []
    var selectedImage: [UIImage] = []
    
    // MARK: - UI Componnets
    private let feedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.estimatedRowHeight = 80.0   // 동적 높이에 대한 기본 높이
        tableView.rowHeight = UITableView.automaticDimension   // 동적 높이
        return tableView
    }()
    
    private let savedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.titleLabel?.textColor = .label
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private let submitButton = CustomButton(customButtonType: .text(title: "저장하기"), hasBackground: true)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setupDelegate()
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedTableView.reloadData()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        view.addSubview(feedTableView)
        // view.addSubview(savedButton)
        view.addSubview(submitButton)
        
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            submitButton.topAnchor.constraint(equalTo: feedTableView.bottomAnchor, constant: 10),
            submitButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
    
    // MARK: - Functions
    private func setupDelegate() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(ImagePickerCell.self, forCellReuseIdentifier: ImagePickerCell.reuseIdentifier)
        feedTableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.reuseIdentifier)
        feedTableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
    }
    
}


extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FeedType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch FeedType.allCases[indexPath.section] {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagePickerCell.reuseIdentifier, for: indexPath) as? ImagePickerCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            return cell
            
        case .title:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.reuseIdentifier, for: indexPath) as? TitleCell else  { return UITableViewCell()}
            
            return cell
        case .content:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as? ContentCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch FeedType.allCases[indexPath.section] {
            
        case .image:
            return 80
        case .title:
            return 80
        case .content:
            return 550
        }
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        switch FeedType.allCases[section] {
    //        case .image:
    //            return "이미지"
    //        case .title:
    //            return "제목"
    //        case .content:
    //            return "내용"
    //        }
    //    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height - 10)
        header.textLabel?.textColor = .label
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch FeedType.allCases[section] {
        case .image:
            return "이미지"
        case .title:
            return "제목"
        case .content:
            return "내용"
        }
    }
}



enum FeedType: CaseIterable {
    case image
    case title
    case content
    
    var settingType: String {
        switch self {
        case .image:
            return "이미지를 선택하세요"
        case .title:
            return "제목을 입력하세요"
        case .content:
            return "내용을 입력하세요"
        }
    }
}


extension FeedViewController: ImagePickerCellDelegate {
    func photoAddCell(_ cell: ImagePickerCell, didselctedImages images: [UIImage]) {
        cell.updateImage(images)
    }
    
    func didSelectImage() {
        presentImagePicker()
    }
}

extension FeedViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let group = DispatchGroup()
        
        for item in results {
            group.enter()
            item.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                
                defer { group.leave() }
                
                if let image = image as? UIImage {
                    self.selectedImage.append(image)
                } else if let error = error {
                    print("Error Loading Image: \(error.localizedDescription)")
                }
            }
            
        }
        
        group.notify(queue: .main) {
            if let cell = self.feedTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImagePickerCell {
                self.photoAddCell(cell, didselctedImages: self.selectedImage)
            }
        }
        
//        for item in results {
//            item.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
//                if let image = image as? UIImage {
//                    DispatchQueue.main.async {
//                        self.selectedImage.append(image)
//                    }
//                } else if let error = error {
//                    print("Error Loading Image: \(error.localizedDescription)")
//                }
//            }
//        }
        
                
    }
    
    private func presentImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 5
        configuration.selection = .ordered
        configuration.preferredAssetRepresentationMode = .automatic
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
}
