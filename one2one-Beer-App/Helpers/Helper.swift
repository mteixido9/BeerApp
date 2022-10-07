class Helper {
    static var app: Helper = {
        return Helper()
    }()
    
  
  
    func getGraduation(abv: Double)-> String {
        if abv < 4.0 {
            return "ABU: \(String(format: "%.1f", abv))% 🟢"
        }
        if abv >= 4.0 && abv <= 9.0{
            return "ABU: \(String(format: "%.1f", abv))% 🟡"
        }
        if (abv > 9.0  && abv <= 15.0) {
            return "ABU: \(String(format: "%.1f", abv))% 🟠"
        }
        if abv > 15.0{
            return "ABU: \(String(format: "%.1f", abv))% 🔴"
        }else{
            return "ABU: \(String(format: "%.1f", abv))% ❔"
        }
    }
    
    func getGraduation(ibu: Double)-> String { 
        if ibu < 10 {
            return "IBU: \(String(format: "%.1f", ibu)) 🟢"
        }
        if ibu >= 10 && ibu <= 20{
            return "IBU: \(String(format: "%.1f", ibu)) 🟡"
        }
        if (ibu > 20  && ibu <= 80) {
            return "IBU: \(String(format: "%.1f", ibu)) 🟠"
        }
        if ibu > 80{
            return "IBU: \(String(format: "%.1f", ibu)) 🔴"
        }else{
            return "ABU: \(String(format: "%.1f", ibu)) ❔"
        }
    }
}
