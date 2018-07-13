namespace Scrabble.letterData
open System.Collections.Generic


module LetterData =
    let dict = new Dictionary<int, string>()
    dict.Add(1, "A")
    dict.Add(2,"B")
    dict.Add(3,"C")
    dict.Add(5,"D")
    dict.Add(6,"E")
    dict.Add(7,"F")
    dict.Add(8,"G")
    dict.Add(9,"H")
    dict.Add(10,"I")
    dict.Add(11,"J")
    dict.Add(12,"K")
    dict.Add(13,"L")
    dict.Add(14,"M")
    dict.Add(15,"N")
    dict.Add(16,"O")
    dict.Add(17,"P")
    dict.Add(18,"Q")
    dict.Add(19,"R")
    dict.Add(20,"S")
    dict.Add(21,"T")
    dict.Add(22,"U")
    dict.Add(23,"V")
    dict.Add(24,"W")
    dict.Add(25,"X")
    dict.Add(26,"Y")
    dict.Add(27,"Z")
    //etc.....
    let getLetters () =
        dict.Values :> seq<string>

    let getLetter id =
        if dict.ContainsKey(id) then
            Some dict.[id]
        else
            None

    let createletter wordinfo =
        "," //trop sale

    let updateletterById wordinfoId letterToBeUpdated =
        None

    let updateword letterToBeUpdated =
        None

    let deleteword letterId =
         dict.Remove(0) |> ignore //bon c de la merde

    let isletterExists  =
        dict.ContainsKey