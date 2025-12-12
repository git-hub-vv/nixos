{ inputs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix 
    ];

  
    vimAlias = true;
    viAlias = true;

    opts = {
      number = true;

    };
  
}
