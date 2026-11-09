{ ... }:
{
     # Zsh
     programs.zsh = {
       enable = true;
       autosuggestions.enable = true;
       zsh-autoenv.enable = true;
       syntaxHighlighting.enable = true;

       ohMyZsh = {
         enable = true;
         plugins = ["git"];
         theme = "ys";
       };
     };

     # Starship enable
     programs.starship = {
       enable = true;
     };
}
