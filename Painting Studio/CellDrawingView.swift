import UIKit

class CellDrawingView: UIView
{
    private var context: CGContext? = nil
    private var _painting: Painting = Painting()
    
    private var lineWidth: Double = 0.5
    private var lineJoin: CGLineJoin = .bevel
    private var lineCap: CGLineCap = .square
    private var lineColor: UIColor = UIColor.white
    private var points = [CGPoint]()
    
    
    private var lastSpot: CGPoint = CGPoint.zero
    private var touchesEnded: Bool = false;
    private var touchesBegan: Bool = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext()!
        
        for polyline in painting.polyLines
        {
            for point in polyline.polyPoints
            {
                if(point.equalTo(polyline.polyPoints.first!)){
                    context?.move(to: point)
                }
                else{
                    context?.addLine(to: point)
                    
                }
                
            }
            context?.setLineWidth(CGFloat(polyline.width))
            context?.setLineCap(polyline.cap)
            context?.setLineJoin(polyline.join)
            context?.setStrokeColor(polyline.color.cgColor)
            context?.drawPath(using: .stroke)
        }
        
    }

    var painting: Painting {
        get{
            return _painting
        }
        set{
            _painting = newValue
        }
    }
    var drawContext: CGContext? {return context}
    
    var color: UIColor
        {
        get{
            return lineColor
        }
        set{
            lineColor = newValue
            NSLog("NEW CELL POLY COLOR: " + "\(lineColor)")
        }
    }
    var cap: CGLineCap
        {
        get{
            return lineCap
        }
        set{
            lineCap = newValue
            //NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }
    var width: Double
        {
        get{
            return lineWidth
        }
        set{
            lineWidth = newValue
            //NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }
    var join: CGLineJoin
        {
        get{
            return lineJoin
        }
        set{
            lineJoin = newValue
            //NSLog("NEW Cell Poly COLOR: " + "\(lineColor)")
        }
    }
    
    
}
