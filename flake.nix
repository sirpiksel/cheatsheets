{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, devshell, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs =
          import nixpkgs {
            inherit system;
            overlays = [ devshell.overlays.default ];
          };
        tex = pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-basic
            adjustbox environ etoolbox fancyvrb fontspec geometry hyphenat listings listingsutf8 minted noto pdfcol pgf sourcecodepro tcolorbox tikzfill tools upquote;
        };
        pygments = pkgs.python312Packages.pygments;

      in
      {
        devShells.default = (pkgs.devshell.mkShell {
          imports = [ "${devshell}/extra/git/hooks.nix" ];
          name = "tex-shell";
          packages = with pkgs; [ tex pygments nixpkgs-fmt ];
          git.hooks = {
            enable = true;
            pre-commit.text = ''
              nix flake check
            '';
          };
          commands = [
            {
              name = "make";
              command = ''
                lualatex -output-directory=. -interaction=nonstopmode -halt-on-error -jobname=$(basename $(pwd)) -shell-escape output.tex
                rm -rf *.aux *.log *.out _minted-vim
              '';
              help = "compile pdf";
            }
            {
              name = "clean";
              command = ''
                rm -rf *.aux *.log *.out _minted-vim
              '';
              help = "remove temporary files";
            }
            {
              name = "prune";
              command = ''
                rm -rf *.pdf *.aux *.log *.out _minted-vim
              '';
              help = "remove all output files";
            }
            {
              name = "new";
              command = ''
                cp --update=none ../output.tex .
                chown philip:philip *.tex
              '';
              help = "create new tex";
            }
          ];
        });
      }
    );
}
