import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    var animator: UIDynamicAnimator!
    var snap: UISnapBehavior!
    
    override func viewWillAppear(_ animated: Bool) {
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        myImageView.addGestureRecognizer(gesture)
        myImageView.isUserInteractionEnabled = true
        
        animator = UIDynamicAnimator(referenceView: self.view) //аниматор для вью
        snap = UISnapBehavior(item: myImageView, snapTo: self.view.center)
//        animator.addBehavior(snap)
        snap.damping = 10

    }
    
//    @objc func panGesture(param: UIPanGestureRecognizer) {
//
//        switch param.state {
//        case .changed:
//            let moved = param.translation(in: self.view) //перемещение
//            myImageView.center = CGPoint(x: myImageView.center.x + moved.x, y: myImageView.center.y + moved.y)
//            param.setTranslation(.zero, in: self.view)
//
//
//        default: ()
//        }
    
    @objc func panGesture(param: UIPanGestureRecognizer) {
        
        switch param.state {
        case .changed:
            let moved = param.translation(in: self.view) //перемещение
            myImageView.center = CGPoint(x: myImageView.center.x + moved.x, y: myImageView.center.y + moved.y)
            param.setTranslation(.zero, in: self.view)
            
        case .began:
            animator.removeBehavior(snap) //когда тянем - выключаем анимацию
            
        case .possible: ()
        case .ended, .cancelled, .failed:
            animator.addBehavior(snap)
            
            
        default: ()
        }
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

