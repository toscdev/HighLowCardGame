//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var opponentsCardImageView: UIImageView!
    @IBOutlet weak var playersCardImageView: UIImageView!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var remainingCardsLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    
    let game = Game()
    
    let cardBackImage = UIImage(named: "back_blue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonStyle()
        startGame()
    }
    
    @IBAction func higherButtonPressed(_ sender: UIButton) {
        endRound(hasHigherSelected: true)
    }
    
    @IBAction func lowerButtonPressed(_ sender: UIButton) {
        endRound(hasHigherSelected: false)
    }
    
    @IBAction func showGameRules(_ sender: UIButton) {
        let gameRulesAlert = UIAlertController(title: "Game Rules", message: game.gameRules, preferredStyle: .alert)
        
        gameRulesAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(gameRulesAlert, animated: true)
    }
    
    func startGame() {
        game.startNewGame()
        updatePointsLabel()
        updateCardImages()
        updateRemainingCardsLabel()
        enableButtons()
    }
    
    func updateCardImages() {
        opponentsCardImageView.image = UIImage(named: game.opponentsCard.name)
        playersCardImageView.image = cardBackImage
    }
    
    func revealPlayersCard() {
        UIView.transition(with: playersCardImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        playersCardImageView.image = UIImage(named: game.playersCard.name)
    }
    
    func endRound(hasHigherSelected: Bool) {
        disableButtons()
        revealPlayersCard()
        game.compareCards(hasHigherSelected: hasHigherSelected)
        updateInfoLabel(showAnswerText: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.nextRound()
        }
    }
    
    func disableButtons() {
        higherButton.isEnabled = false
        lowerButton.isEnabled = false
    }
    
    func enableButtons() {
        higherButton.isEnabled = true
        lowerButton.isEnabled = true
    }
    
    func nextRound() {
        if game.remainingCards < 2 {
            // All cards dealt
            gameOver()
        } else {
            game.dealCards()
            updateCardImages()
            updatePointsLabel()
            updateRemainingCardsLabel()
            enableButtons()
            updateInfoLabel(showAnswerText: false)
        }
    }
    
    func updatePointsLabel() {
        pointsLabel.text = "Points: \(game.points)"
    }
    
    func updateRemainingCardsLabel() {
        remainingCardsLabel.text = "Remaining cards: \(game.remainingCards)"
    }
    
    func updateInfoLabel(showAnswerText: Bool) {
        if showAnswerText {
            if game.userAnswerIsCorrect {
                infoLabel.text = "Your guess was correct!"
            } else {
                infoLabel.text = "Your guess was not correct."
            }
        } else {
            infoLabel.text = "Your card is"
        }
    }
    
    func gameOver() {
        let gameOverAlert = UIAlertController(title: "Game Over", message: "You got \(game.points) Points!", preferredStyle: .alert)
        
        gameOverAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startGame()
        }))
        
        self.present(gameOverAlert, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameViewController {
    func setButtonStyle() {
        higherButton.setGradientBackground(firstColor: UIColor(named: "buttonRed")!, secondColor: UIColor(named: "buttonRedDark")!)
        lowerButton.setGradientBackground(firstColor: UIColor(named: "buttonBlue")!, secondColor: UIColor(named: "buttonBlueDark")!)
    }
}
