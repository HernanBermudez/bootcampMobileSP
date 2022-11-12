import UIKit

struct RandomString {
    let tipoA = "tipoa";
    let tipoB = "tipob";
    var randomNumbersString = "";
    mutating func getRandomString(str: String) -> String{
        if str.lowercased() != tipoA && str.lowercased() != tipoB{
            print("Wrong input. Must be either TipoA or TipoB")
        } else {
            if str.lowercased() == tipoA {
                randomNumbersString.append("54")
                for _ in 1...8 {
                    randomNumbersString.append(String(Int.random(in: 1..<10)))
                }
                //print(randomNumbersString)
            }
            if str.lowercased() == tipoB {
                randomNumbersString.append("08")
                for _ in 1...8 {
                    randomNumbersString.append(String(Int.random(in: 1..<10)))
                }
                //print(randomNumbersString)
            }
        }
        let stringForReturn = randomNumbersString
        randomNumbersString = ""
        return stringForReturn
    }
}

 // Uncomment this lines for testing or use it as reference:
 // Instance of the structure RandomString:
var randomString = RandomString()
print(randomString.getRandomString(str: "Tipoa"))
print(randomString.getRandomString(str: "TipoB"))


//
/// This function sorts a given random string of integers into a sorted array of integers. Uses Insertion Sort Algorithm.
/// - Parameters:
///   - randomString: The random string that will be sorted. It can be used the method created above.
///   - order: The order that the array will be sorted. "Asc" or "Desc".
/// - Returns: Returns the sorted array.
func sortingArray (randomString: String, order: String) -> Array<Int>{
    
    var randomArray = Array<Int>()
    
    // First checks if the input string has its numbers separated by comas.
    // Then converts it to the array of integers that will be sorted.
    
    if randomString.contains(","){
        randomArray = randomString.split(separator: ",").compactMap{Int($0)}
    } else {
        randomArray = randomString.compactMap{$0.wholeNumberValue}
    }
    
    if order.lowercased() != "asc" && order.lowercased() != "desc"{
        print("Wrong input. Order must be Asc or Desc. Array not sorted:")
    } else {
        if order.lowercased() == "desc"{
            for index in 0..<randomArray.count{
                let key = randomArray[index]
                var i = index - 1
                while (i >= 0 && randomArray[i] < key){
                    randomArray[i+1] = randomArray[i]
                    i = i - 1
                }
                randomArray[i+1] = key
            }
        } else {
            for index in 0..<randomArray.count{
                let key = randomArray[index]
                var i = index - 1
                while (i >= 0 && randomArray[i] > key){
                    randomArray[i+1] = randomArray[i]
                    i = i - 1
                }
                randomArray[i+1] = key
            }
        }
    }
    return randomArray
}

print(sortingArray(randomString: randomString.getRandomString(str: "TipoB"), order: "asc"))

print(sortingArray(randomString: "12,3,2,4,94,32,64,103,242,15,0", order: "asc"))
