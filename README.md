## N2THAUFAZCAPW2 (Nand2Tetris Hack Assembly French-Azerbaijani University Computer Architecture Project Work 2)
what a long title, huh...

How to run:

 1. Download the CPU Emulator for the Nand2Tetris Hack Assembly.
 2. Open the provided .asm file from the repository.
 3. Ensure that all animations are disabled.
 4. Run the program.

Use your keyboard's arrow keys to control the character. The character is 16x16 pixels, and the screen in the emulator is 512x256, meaning there is a 32x16 grid for the character to move inside. There are four sprites for the character depending on the last action.

I found creating this project much more engaging and productive compared to simply drawing in ASM or displaying predefined text by clicking a button. It provides a deeper understanding of how assembly works because:

 1. If I were to draw a predefined image, it would require over 10k characters, but no actual code would be present except for "move this pixel to that address."
 2. In those projects, there are little to no keyboard interactions, and those interactions are always predictable.
 3. In this project, one can interact with memory addresses that are not @SCREEN and @KBD.
 4. This project is potentially scalable.

The first prototype (with no sprites, just a black square) was about 216 lines in ROM. After adding four sprites, it became approximately 800 characters (lines 316-984 for sprites) (669 lines for sprites only, meaning roughly 130 lines of other code).

If you're unfamiliar with the project's goals: "Draw a pattern on the screen (You can draw any pattern). You can after scrolling it, make a simple animation and using the Keyboard to control it. If you have time try to make a simple game (The project must be written in HACK assembly language)."
Animation is impossible to achieve unless program flow animation is enabled in the emulator. 
I hope this project qualifies as a game. 😉
