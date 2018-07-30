import UIKit
class ViewController: UIViewController {

    var docs, filePath, fileName: String!;
    
    let fileMngr = FileManager.default;
    
    override func viewDidLoad() {
        //Path to Documents directory
        docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        
        print(docs);
        //name of the file
        fileName = "bubu.txt";
        //full path to the file
        filePath = docs+"/"+fileName;
        
        
        
        
        //Create
        let img = UIImage(named: "deadpool")!;
        let imgData = UIImageJPEGRepresentation(img, 0.5)!;
        write(data: imgData, fileName: "deadpool.jpg");
        
        let txt = "Avia the queen";
        write(txt: txt);
        
        //Read
        print(read());
        
        //Update
        append(txt: "Bubu is awesome");
        
        print(read());
        
        //Delete
        
        deleteContents();
        
        deleteFile();
        
        
    }
    
    //Create if not exists file with given contents
    func write(data: Data, fileName: String){
        let file = docs+"/"+fileName;
        if !fileMngr.fileExists(atPath: file){
            fileMngr.createFile(atPath: file, contents: data, attributes: nil);
        }
    }
    //Write text to file
    func write(txt: String){
        do{
            try txt.write(toFile: filePath, atomically: true, encoding: .utf8);
        }catch{
            print("Can't write to file");
        }
    }
    //Read contents of file
    func read()->String{
        do{
            return try String(contentsOfFile: filePath);
        }catch{
            return "";
        }
    }
    //Update
    func append(txt: String){
        write(txt: read() + txt);
    }
    
    //Delete
    
    func deleteContents(){//clear contents
        write(txt: "");
    }
    
    func deleteFile(){//drop file
        do{
            try fileMngr.removeItem(atPath: filePath);
        }catch{
            print("Couldn't remove file");
        }
    }
    
}








