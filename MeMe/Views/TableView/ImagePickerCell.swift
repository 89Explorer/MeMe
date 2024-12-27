//
//  ImagePickerCell.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class ImagePickerCell: UITableViewCell{
    
    // MARK: - Variables
    static var reuseIdentifier: String = "ImagePickerCell"
    
    var selectedImageArray: [UIImage] = [] {
        didSet {
            // 데이터가 변경될 때 컬렉션뷰를 업데이트
            imageCollelcitonView.reloadData()
        }
    }
    
    weak var delegate: ImagePickerCellDelegate?
    
    // MAKR: - UI Componnets
    private let basicView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.backgroundColor = .systemBrown
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    // private let imageTitle: CustomLabel = CustomLabel(customLabelType: .title, title: "사진을 선택해주세요")
    
    private let imageButton: CustomButton = CustomButton(customButtonType: .systemName(imageName: "camera", title: "최대 5장 선택 가능"), hasBackground: true)
    
    private let imageCollelcitonView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        //layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBrown
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBrown
        
        configureConstraints()
        setupDelegate()
        
        imageButton.addTarget(self, action: #selector(didSelectedImageButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        contentView.addSubview(basicView)
        
        //basicView.addSubview(imageTitle)
        basicView.addSubview(imageButton)
        basicView.addSubview(imageCollelcitonView)
        
        basicView.translatesAutoresizingMaskIntoConstraints = false
        //imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageCollelcitonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            basicView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            basicView.topAnchor.constraint(equalTo: contentView.topAnchor),
            basicView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //imageTitle.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 5),
            //imageTitle.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 5),
            
            imageButton.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 0),
            imageButton.centerYAnchor.constraint(equalTo: basicView.centerYAnchor, constant: 0),
            imageButton.widthAnchor.constraint(equalToConstant: 80),
            imageButton.heightAnchor.constraint(equalToConstant: 80),
            
            imageCollelcitonView.leadingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: 10),
            imageCollelcitonView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 0),
            imageCollelcitonView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: 0),
            imageCollelcitonView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: 0),
            
            // 고정된 높이를 사용하지 않음: 기본 높이는 동적으로 변경 가능
            imageCollelcitonView.heightAnchor.constraint(equalToConstant: 80) // 필요에 따라 조정
            
        ])
        
    }
    
    // MARK: - Functions
    private func setupDelegate() {
        imageCollelcitonView.delegate = self
        imageCollelcitonView.dataSource = self
        imageCollelcitonView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.resumeIdentifier)
    }
    
    func updateImage(_ images: [UIImage]) {
        self.selectedImageArray = images
    }
    
    // MARK: - Acitons
    @objc private func didSelectedImageButton() {
        delegate?.didSelectImage()
    }
    
}

// MARK: - Extension
extension ImagePickerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = selectedImageArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.resumeIdentifier, for: indexPath) as? ImageCell
        
        cell?.configure(with: image)
        
        return cell!
    }
    
}

extension ImagePickerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 셀 크기를 동적으로 계산하여 정사각형으로 만듦
        let height = collectionView.frame.height
        let size = CGSize(width: height, height: height)
        return size
    }
}

protocol ImagePickerCellDelegate: AnyObject {
    func didSelectImage()
    func photoAddCell(_ cell: ImagePickerCell, didselctedImages images: [UIImage])
}
