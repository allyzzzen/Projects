#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Personalized Music Playlist Generator

Description: This program allows users to input their mood or favorite genres
and it generates a custom playlist suggestion. If mood is selected, the program matches
predefined moods with a corresponding playlist. If genre is selected, the program
provides a playlist based on user preferences.

@author: allyzzzen (Allison Zeanchock)
"""
#%%
"""
Main Function
-Acts as the entry point of the program

"""
def main():
    print("Welcome to the Personalized Music Playlist Generator!") #Greets the user
    print("\n(The playlists generated are based on Korean, Japanese, and Western music)")
    while True: #Starts a loop for repeated user interaction
        category = input("\nWould you like a playlist based on 'mood' or genre'?") #Prompts user input
        if category not in ("mood", "genre"): #Checks if user input is true/valid
            print("Invalid choice. Please choose 'mood' or 'genre'.")
            continue #Prompts the user again if input invalid
        
        print("Here are some examples you can use:") #Provides the user some mood or genre examples
        if category == "mood":
            print("- Mood options: happy, sad, anger, calm, energetic")
        else:
            print("- Genre options: pop, indie, rock, metal, classical, electronic")
        
        selection = input(f"Enter your {category} (i.e. 'happy' or 'rock')") #Ask user for specific input based on mood or genre
        
    
        playlist = generate_playlist(category, selection) #Generates a playlist based on user input
        
        if playlist: #If a playlist is found, display the playlist to user
            print("\nHere's your custom playlist!")
            for i, song in enumerate(playlist, 1): #loops through each song in the playlist
                print(f"{i}. {song['title']}, by {song['artist']}") #Displays song details
                
            cont = input("Would you like another playlist? (yes/no):") #Asks user if they want another playlist
            if cont != "yes": #Exits the loop if user doesn't want another playlist
                print("Thanks for using the Playlist Generator! Goodbye!")
                break
            
        else: #For cases where no playlist matches the user's input
            print("No playlist found for that selection. Try again.")
            cont = input("Would you like to try again? (yes/no):") #Asks user if they want another playlist
            if cont != "yes": #Exits the loop if user doesn't want another playlist
                print("Thanks for using the Playlist Generator! Goodbye!")
                break
            
#%%
"""
Playlist Generator Function
-Function to generate a playlist based on the cateogry and user input

"""
def generate_playlist(category, selection):
    playlist = { #Defines predfined playlists for both mood and genre categories
        "mood": { #playlists based on mood
            "happy":[{"title": "Permission to Dance", "artist": "BTS" }, {"title": "Chasing That Feeling", "artist": "Tomorrow X Together"}, {"title": "Case 143", "artist": "StrayKids"}, {"title": "New Dance", "artist": "XG"}],
            "sad":[{"title": "Seoul", "artist": "RM"}, {"title": "Blue", "artist": "V"}, {"title": "Snooze", "artist": "Agust D"}, {"title": "Hate You", "artist": "Jungkook"}],
            "anger":[{"title": "Arson", "artist": "Jhope" }, {"title": "Slash", "artist": "StrayKids"}, {"title": "Teeth", "artist": "Wage War"}, {"title": "Skin", "artist": "Beartooth"}],
            "calm":[{"title": "Still With You", "artist": "Jungkook"}, {"title": "Runaway", "artist": "Aurora"}, {"title": "Birds of a feather", "artist": "Billie Eilish"}, {"title": "Butterfly", "artist": "BTS"}],
            "energetic":[{"title": "Work", "artist": "Ateez"}, {"title": "Earth, Wind, & Fire", "artist": "BoyNextDoor"}, {"title": "LALALI", "artist": "Seventeen"}, {"title": "Chk Chk Boom", "artist": "StrayKids"}]
            },
        "genre": { #playlists based on genre
            "pop": [{"title": "Dynamite", "artist": "BTS"}, {"title": "APT.", "artist": "Rose & Bruno Mars"}, {"title": "Standing Next to You", "artist": "Jungkook"}, {"title": "CBZ (Prime time)", "artist": "BSS"}],
            "rock": [{"title": "Delusion:All", "artist": "ONEOKROCK"}, {"title": "Stairway to Heaven", "artist": "Led Zeppelin"}, {"title": "Don't Stop Believin'", "artist": "Journey"}, {"title": "Thunderstruck", "artist": "AC/DC"}],
            "metal": [{"title": "F.L.Y.", "artist": "ICE NINE KILLS"}, {"title": "The Past Is Dead", "artist": "Beartooth"}, {"title": "Manic", "artist": "Wage War"}, {"title": "Riot", "artist": "Hollywood Undead"}],
            "classical": [{"title": "Symphony No. 9 in D minor, Op. 125", "artist": "Ludwig van Beethoven"}, {"title": "Clair de lune", "artist": "Claude Debussy"}, {"title": "The Four Seasons", "artist": "Antonio Vivaldi"}, {"title": "Symphony No. 3", "artist": "Camille Saint-Saens"}],
            "electronic": [{"title": "SMB", "artist": "Odetari & Ateez"}, {"title": "JJAM", "artist": "StrayKids"}, {"title": "Clarity", "artist": "Zedd"}, {"title": "In the Name of Love", "artist": "Martin Garrix & Bebe Rexha"}],
            "indie": [{"title": "Smoke Sprite", "artist": "So!YoON & RM"}, {"title": "Understand", "artist": "MELOH"}, {"title": "2049", "artist": "Tabber"}, {"title": "Way Back Home", "artist": "Shaun"}]
            }
        }
    return playlist.get(category, {}).get(selection) #Use the category and selection to fetch the corresponding playlist, if no matching playlist is found, return none


#%%
"""
Run the program
-Program execution; Prevents unintended execution
- "__name__" = special variable; when run directly, "__name__" is set to "__main__"
when imported, "__name__" is set to the name of the script/module
-main() = function that contains the main logic of the program, if ran directly this line calls the main() function

"""
if __name__ == "__main__": #Check if the script is being run directly, not when imported
    main() #Calls the main function to start the program


#%%