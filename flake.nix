{
  description = "My website build environment";
  #nixConfig.bash-prompt = ''\n\[\033[1;32m\][\[\e]0;\]my-website\[: \w\a\]\u@\h:\w]\$\[\033[0m\]'';
nixConfig.bash-propmt-prefix = "website";
  inputs = { nixpkgs.url = "nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      fooScript = pkgs.writeScriptBin "foo.sh" ''
        #!/bin/sh
        echo $FOO
      '';
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "My website environment";
        buildInputs = [
pkgs.git	
          fooScript
pkgs.nodejs
pkgs.bundler
pkgs.rbw
pkgs.jq
pkgs.ripgrep
        ];
        shellHook = ''
          echo "Welcome in $name"
          export FOO="BAR"
        '';
      };
    };
}

