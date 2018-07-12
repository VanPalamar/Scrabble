namespace Scrabble.wordData

open System.Collections.Generic

type Word = {
    Id : int
    Content : string
}

module WordInfo =

    let WordStorage = new Dictionary<int, Word>()
    let getWords () =
        WordStorage.Values :> seq<Word>
    let getWord id =
        if WordStorage.ContainsKey(id) then
            Some WordStorage.[id]
        else
            None
    let createword wordinfo =
        let id = WordStorage.Values.Count + 1
        let newword = {wordinfo with Id = id}
        WordStorage.Add(id, newword)
        newword

    let updatewordById wordinfoId wordinfoToBeUpdated =
        if WordStorage.ContainsKey(wordinfoId) then
            let updatedword = {wordinfoToBeUpdated with Id = wordinfoId}
            WordStorage.[wordinfoId] <- updatedword
            Some updatedword
        else
            None

    let updateword wordinfoToBeUpdated =
        updatewordById wordinfoToBeUpdated.Id wordinfoToBeUpdated

    let deleteword wordinfoId =
        WordStorage.Remove(wordinfoId) |> ignore

    let isWordExists  = WordStorage.ContainsKey