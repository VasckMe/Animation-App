//
//  HistoryViewController.swift
//  Animation App
//
//  Created by Apple Macbook Pro 13 on 28.08.22.
//

import Spring
import UIKit

class HistoryViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private weak var startButton: SpringButton!
    @IBOutlet private weak var orangeView: SpringView! { didSet { orangeView.isHidden = true }}
    @IBOutlet private weak var endLabel: UILabel!
    @IBOutlet private weak var pinkView: SpringView! { didSet { pinkView.isHidden = true }}
    
    // MARK: Properties

    var kidView = SpringView()
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        kidView.isHidden = true
        episodeController(view: kidView, action: .FadeOut)
        kidView.backgroundColor = .green
        prepareForHistory()
    }
    
    // MARK: IBActions

    @IBAction private func historyActions(_ sender: SpringButton) {
        sender.animation = AnimationType.FadeOut.rawValue
        sender.duration = 2
        sender.animate()
        sender.animateNext {
            self.orangeView.isHidden = false
            self.pinkView.isHidden = false
            self.firstEpisode()
        }
    }
    
    // MARK: Private functions

    private func prepareForHistory() {
        orangeView.animation = AnimationType.FadeOut.rawValue
        pinkView.animation = AnimationType.FadeOut.rawValue
        orangeView.animate()
        pinkView.animate()
    }
    
    private func firstEpisode() {
        episodeController(view: pinkView, action: .FadeIn)
        episodeController(view: pinkView, action: .Swing)
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.pinkView.frame.origin.x += 40
            self.pinkView.frame.origin.y += 250
        } completion: { _ in
            self.secondEpisode()
        }
    }
    
    private func secondEpisode() {
        episodeController(view: orangeView, action: .FadeIn)
        episodeController(view: orangeView, action: .Pop)
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.orangeView.frame.origin.x = self.pinkView.frame.origin.x
            self.orangeView.frame.origin.y = self.pinkView.frame.origin.y + self.pinkView.bounds.height
        } completion: { _ in
            self.thirdEpisode()
        }
    }
    
    private func thirdEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.pinkView.frame.origin.y -= 60
            self.episodeController(view: self.pinkView, action: .Swing)
        } completion: { _ in
            self.forthEpisode()
        }
    }
    
    private func forthEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.orangeView.frame.origin.y -= 60
        } completion: { _ in
            self.fifthEpisode()
        }
    }
    
    private func fifthEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.pinkView.frame.origin.x += 60
            self.pinkView.frame.origin.y -= 60
            self.episodeController(view: self.pinkView, action: .Swing)
        } completion: { _ in
            self.sixEpisode()
        }
    }
    
    private func sixEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.orangeView.frame.origin.x += 60
            self.orangeView.frame.origin.y -= 60
        } completion: { _ in
            self.sevenEpisode()
        }
    }
    
    private func sevenEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.orangeView.frame.size.width *= 3
            self.orangeView.frame.size.height *= 3
            self.orangeView.frame.origin.y = self.pinkView.frame.origin.y + self.pinkView.bounds.height * 3
            self.pinkView.frame.size.width *= 3
            self.pinkView.frame.size.height *= 3
            self.orangeView.frame.origin.x -= 50
            self.pinkView.frame.origin.x -= 50
            self.pinkView.alpha = 0.7
            self.orangeView.alpha = 0.7
        } completion: { _ in
            self.eightEpisode()
        }
    }

    private func eightEpisode() {
        episodeController(view: orangeView, action: .Swing)
        episodeController(view: pinkView, action: .Swing)
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: [.curveEaseIn]) {} completion: { _ in
            self.nineEpisode()
        }
    }
    
    private func nineEpisode() {
        kidView.frame = CGRect(x: pinkView.frame.origin.x + pinkView.bounds.width / 2-20,
                               y: pinkView.frame.origin.y + pinkView.bounds.height + 5-20,
                               width: 40,
                               height: 40)
        view.addSubview(kidView)
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.pinkView.frame.origin.y -= 30
            self.orangeView.frame.origin.y += 30
        } completion: { _ in
            UIView.animate(withDuration: 5,
                           delay: 1,
                           options: [.curveEaseIn]) {
                self.episodeController(view: self.kidView, action: .FadeIn)
                self.kidView.isHidden = false
            }
            self.tenEpisode()
        }
    }
    
    private func tenEpisode() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.end()
        }
    }
    
    private func end() {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       options: [.curveEaseIn]) {
            self.episodeController(view: self.orangeView, action: .FadeOut)
            self.episodeController(view: self.pinkView, action: .FadeOut)
            self.episodeController(view: self.kidView, action: .FadeOut)
        } completion: { _ in
            
            UIView.animate(withDuration: 5,
                           delay: 0.5,
                           options: [.curveEaseIn]) {
                self.endLabel.isHidden = false
            }
        }
    }
    
    private func episodeController(view: SpringView, action: AnimationType) {
        view.animation = action.rawValue
        view.duration = 2
        view.animate()
    }
}
