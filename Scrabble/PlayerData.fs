namespace Scrabble.PlayerData

open System.Collections.Generic

type Player = {
    Id : int
    Name : string
}

module PlayerData =
    let playerStorage = new Dictionary<int, Player>()
    playerStorage.Add(1, {Id = 1; Name ="Dam"})
    playerStorage.Add(2, {Id = 2; Name ="Tristan"})
    playerStorage.Add(3, {Id = 3; Name ="Ram"})
    playerStorage.Add(4, {Id = 4; Name ="Val"})
        
    let getPeople () =
        playerStorage.Values :> seq<Player>
    let getPlayer id =
        if playerStorage.ContainsKey(id) then
            Some playerStorage.[id]
        else
            None
    let createPlayer person =
        let id = playerStorage.Values.Count + 1
        let newPlayer = {person with Id = id}
        playerStorage.Add(id, newPlayer)
        newPlayer

    let updatePlayerById personId personToBeUpdated =
        if playerStorage.ContainsKey(personId) then
            let updatedPlayer = {personToBeUpdated with Id = personId}
            playerStorage.[personId] <- updatedPlayer
            Some updatedPlayer
        else
            None

    let updatePlayer personToBeUpdated =
        updatePlayerById personToBeUpdated.Id personToBeUpdated

    let deletePlayer personId =
        playerStorage.Remove(personId) |> ignore

    let isPlayerExists  = playerStorage.ContainsKey