AP-CS_Spring_Final_Project:
===========================

Final Project for AP Computer Science Spring 2015

Members
=======
Sammi Wu Leung & Dillon Zhang (Period 1)

Project
=======
Creating Pacman through Processing
- [X] Pacman Sprite
- [X] Ghost Sprite
- [X] Board Pieces
- [X] Start Screen
- [X] High Score Screen

Usage
=====
Download the files, you only need everything in the Main directory. Open Main.pde and click run. This will bring you to a startscreen. Everything will then run on the ASWD keys. Good luck and have fun! Relive your childhood.

Changelog
=========
| Timestamp  | Contributor  | Description |
|:-----------|:------------:|:------------|
| 2015-05-19 | DZ           | Created Repo and README.md |  
| 2015-05-19 | DZ           | Created Main.pde, Board.pde; |
| 2015-05-19 | DZ           | Created Piece.pde, PieceXX.pde; Setup drawPiece() |
| 2015-05-22 | SWL          | Edited files to reflect change in approach to drawing the game board |
| 2015-05-24 | SWL          | Began working on High Score screen (to be integrated later) |
| 2015-05-24 | DZ           | Selected Reference File for the board |
| 2015-05-28 | DZ           | Created Board, Reading in Board |
| 2015-05-31 | DZ           | Started to create the pieces of the board |
| 2015-05-31 | SWL          | Began working on 3-letter name input for the high score |
| 2015-05-31 | DZ           | Finished board's skeleton |
| 2015-06-01 | SWL          | Added unfunctional submit button and made character arrows flash |
| 2015-06-01 | DZ           | Added Pacman Sprite to Board, Animated Power Dots |
| 2015-06-01 | SWL          | Made the submit button functional in High Score Screen |
| 2015-06-02 | SWL / DZ     | Made Spooky Ghosts Sprites, Selected DZ's |
| 2015-06-03 | SWL          | Made basic Scared Ghosts |
| 2015-06-04 | DZ           | Modified Scared Ghosts |
| 2015-06-08 | SWL          | Began working on StartScreen | 
| 2015-06-10 | DZ           | Aligned Pacman to the Board, Cleaned Code |
| 2015-06-11 | DZ           | Fixed board clipping, Processing is too slow to keep track of changes |
| ????-??-?? | ??? / ??     | Forgetting to update the devlog... |

Analysis
========
Although this project is not as developed as we would like, we had constantly hit bumps and obstacles that were unforseen. This included the lag created by processing. This limited our conditional statements and forced us to uses inequalities rather than equalities. Therefore we had to rethink and recreate algorithms that accounted for bidirectional movements and cardinal direction handling. Our maze algorithms did not implement as smoothly as we would have liked into Pacman. After each taking a shot at writing a proper maze algorithm (see commits) for the game, we ultimately gave up on the maze algorithm due to time constraints. Our developement process also could use improvement. With our strong original plan lacking any contingency, any issue that arised took far more time to address than nessecary. For example, we developed our sprites, start and end screens seperately from the main portion. When it came time to add it, we ran into issues where one unit of measure in one was different than the other. We lacked consistency across the board and had to rewrite and readapt files to fit into our main. After running into constant unforseen problems and having to adapt our code to account for them, our original plan was redrawn and scaled back unfortunately. However, this is still a successful project that has room for improvement!