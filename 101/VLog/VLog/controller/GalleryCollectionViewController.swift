//
//  GalleryCollectionViewController.swift
//  VLog
//
//  Created by Benny Davidovitz on 06/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreData
import AVKit

class GalleryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var controller : NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
    }
    
    private func fetchData(){
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        self.controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: DatabaseManager.manager.context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        try? controller.performFetch()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return controller.sections?.count ?? 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.sections![section].numberOfObjects
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCell
    
        // Configure the cell
        cell.configure(with: controller.object(at: indexPath))
        cell.delegate = self
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension GalleryCollectionViewController : ItemCellDelegate{
    func itemCellDidPressPlay(_ cell: ItemCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else{
            return
        }
        
        let obj = controller.object(at: indexPath)
        
        let playerVC = AVPlayerViewController()
        let url = Utils.videoUrlBy(videoId: obj.videoId!)
        playerVC.player = AVPlayer(url: url)
        
        self.present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    
}

extension GalleryCollectionViewController : NSFetchedResultsControllerDelegate{
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            collectionView?.insertItems(at: [newIndexPath!])
        default:
            return
        }
        
    }
}













