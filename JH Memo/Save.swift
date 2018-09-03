
import UIKit

class Save: UIViewController {

    @IBOutlet weak var SaveTextView: UITextView!
    @IBOutlet weak var DeleteButton: UIButton!
    
    var MemoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            SaveTextView.text = "..."
            DeleteButton.setTitle("Back", for: .normal)
            // DeleteButton.isHidden = true
            
        } else {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            
            SaveTextView.text = MemoData[MemoNumber]
            DeleteButton.setTitle("Delete", for: .normal)
        }
        
        
        
    }

    @IBAction func saveFunc1(_ sender: Any) {
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            MemoData.insert(SaveTextView.text, at: 0)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }else{
            MemoData.remove(at: MemoNumber)
            MemoData.insert(SaveTextView.text, at: MemoNumber)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
        
    }
    
    @IBAction func DeleteMemo(_ sender: Any) {
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber != -1 {
            MemoData.remove(at: MemoNumber)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
        
        
    }
    
}
