{
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      isBashFile = path: (pkgs.lib.hasSuffix ".bash" path);
      files = (builtins.attrNames (builtins.readDir ./.));

      scripts = map
        (s: builtins.substring 0 ((builtins.stringLength s) - 5) s)
        (builtins.filter isBashFile files);
    in {
      formatter.${system} = pkgs.nixpkgs-fmt;
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.bash ];
      };

      packages.${system} = let
        getFile = f: ./. + ("/" + f + ".bash");
        scriptsMap = p:
          (pkgs.writeShellScriptBin p (builtins.readFile (getFile p)));
      in (nixpkgs.lib.genAttrs scripts scriptsMap);
    };
}
