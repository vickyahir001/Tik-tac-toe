





import UIKit

class ViewController3 : UIViewController {

    @IBOutlet var buttons: [UIButton]!
      @IBOutlet weak var xScore: UILabel!
      @IBOutlet weak var oScore: UILabel!
      @IBOutlet weak var xScoreLabel: UILabel!
      @IBOutlet weak var oScoreLabel: UILabel!
      var boarder = [String]()
      var currentPlayer = ""
      var point = 0
      var score = 0
      
      var values = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]
      
      override func viewDidLoad() {
          super.viewDidLoad()
          board()
          value()
          //showalert(title: "")
        // point = score
      }
      
      @IBAction func buttonsAction(_ sender: UIButton) {
          let index = buttons.lastIndex(of: sender)!
           
          if !boarder[index].isEmpty
          {
              return
          }
          if currentPlayer == "O"
          {
              sender.setTitle("O", for: .normal)
              currentPlayer = "X"
              boarder[index] = "O"
          }
          else
          {
              sender.setTitle("X", for: .normal)
              currentPlayer = "O"
              boarder[index] = "X"
             
          }
          value()
      }
   
      func value()
      {
          for j in values
          {
              let player0 = boarder[j[0]]
              let player1 = boarder[j[1]]
              let player2 = boarder[j[2]]
              
              if player0 == player1,
                 player1 == player2,
                 !player2.isEmpty
              {
                 // print(player1)
                  //print("Win is \(player0)")
                  showalert(title: "Awasom win is \(player2)!")
                  return
              }
              else if !boarder.contains("")
             {
                 showalert(title: "It's a tie")
               
             }
             
               
          }
      }
      func reload()
      {
          boarder.removeAll()
         // loadView()
          board()
          for k in buttons
          {
              k.setTitle(nil, for: .normal)
          }
      }
      
      func showalert(title:String)
      {
          let alert = UIAlertController(title: "", message: title, preferredStyle: .alert)
          alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { _ in
              self.reload()
          }))
          //alert.addAction()
          present(alert, animated: true, completion: nil)
      }
      func board()
      {
          for i in 0..<buttons.count
          {
              boarder.append("")
          }
      }
      
  }
