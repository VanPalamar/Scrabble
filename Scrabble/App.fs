
namespace Scrabble

module App =   
    open Suave.Web
    open Scrabble.Rest
    open Scrabble.Data
    open Suave

    type AudienceDto = {
        AudienceId : string
        Name : string  
    }    

    [<EntryPoint>]
    let main argv =    

        let personWebPart = rest "player" {
            GetAll = Data.getPeople
            GetById = Data.getPlayer
            Create = Data.createPlayer
            Update = Data.updatePlayer
            UpdateById = Data.updatePlayerById
            Delete = Data.deletePlayer
            IsExists = Data.isPlayerExists
        }

       
        let app = choose[personWebPart]                    

        startWebServer defaultConfig app
            
        0