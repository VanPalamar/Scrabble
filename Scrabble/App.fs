
namespace Scrabble

module App =   
    open Suave.Web
    open Scrabble.Rest
    open Scrabble.PlayerData
    open Scrabble.wordData
    open Scrabble.letterData
    open Suave
    open System

    type AudienceDto = {
        AudienceId : string
        Name : string  
    }    

    [<EntryPoint>]
    let main argv =    

        let personWebPart = rest "player" {
            GetAll = PlayerData.getPeople
            GetById = PlayerData.getPlayer
            Create = PlayerData.createPlayer
            Update = PlayerData.updatePlayer
            UpdateById = PlayerData.updatePlayerById
            Delete = PlayerData.deletePlayer
            IsExists = PlayerData.isPlayerExists
        }
        let wordWebPart = rest "word" {
            GetAll = wordData.WordInfo.getWords
            GetById = WordInfo.getWord
            Create = WordInfo.createword
            Update = WordInfo.updateword
            UpdateById = WordInfo.updatewordById
            Delete = WordInfo.deleteword
            IsExists = WordInfo.isWordExists
        }
        let wordWebPart = rest "letter" {
            GetAll = letterData.LetterData.getLetters
            GetById = LetterData.getLetter
            Create = LetterData.createletter
            Update = LetterData.updateword
            UpdateById = LetterData.updateletterById
            Delete = LetterData.deleteword
            IsExists = LetterData.isletterExists
        }
        

       
        let app = choose[personWebPart; wordWebPart]                    

        startWebServer defaultConfig app
            
        0