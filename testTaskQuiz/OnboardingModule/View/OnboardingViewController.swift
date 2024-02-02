//
//  ViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 29.01.2024.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    private let presenter: OnboardingPresenter
    
    //MARK: - UI Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: ConstantOnboardingData.backgroundImages[0])
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: "SettingsCollectionViewCell")
        return collectionView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ConstantOnboardingData.buttonBackground[0]), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(nextDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    //MARK: - LifeCycle
    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @objc private func nextDidTapped() {
        presenter.nextButtonDidTapped()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(75)
        }
        
        view.addSubview(pageControl)
        pageControl.setContentCompressionResistancePriority(.required, for: .horizontal)
        pageControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.greaterThanOrEqualTo(nextButton.snp.leading).offset(-20)
            make.centerY.equalTo(nextButton.snp.centerY)
        }
    }
}

//MARK: - CollectionView methods
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ConstantOnboardingData.backgroundImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
            cell.configure(with: ConstantOnboardingData.data[indexPath.row])
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCollectionViewCell", for: indexPath) as! SettingsCollectionViewCell
            return cell
        default:
            fatalError("Unexpected indexPath row")
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnboardingViewController: OnboardingViewProtocol {
    func updateView() {
        nextButton.setImage(UIImage(named: ConstantOnboardingData.buttonBackground[pageControl.currentPage]), for: .normal)
        backgroundImageView.image = UIImage(named: ConstantOnboardingData.backgroundImages[pageControl.currentPage])
    }
    
    func moveToNextPage() {
        let nextIndexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        
        if pageControl.currentPage < 2 {
            pageControl.currentPage = pageControl.currentPage + 1
        }
        
        guard nextIndexPath.item < collectionView.numberOfItems(inSection: 0) else {
            return
        }
        
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
}
