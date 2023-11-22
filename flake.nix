{
  outputs = { self, nixpkgs }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system:
            let
              pkgs = nixpkgs.legacyPackages.${system};
            in
            function pkgs);
    in
    {
      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);
      devShells = forAllSystems (pkgs:
        let
          default = pkgs.mkShell {
            packages = [ pkgs.bash ];
          };
        in
        { inherit default; });

      packages = forAllSystems (pkgs: with builtins;
        let
          bashExt = ".bash";
          isBashFile = path: (pkgs.lib.hasSuffix bashExt path);
          files = (attrNames (readDir ./.));

          scripts = map
            (s:
              substring 0 ((stringLength s) - (stringLength bashExt)) s)
            (filter isBashFile files);

          scriptsMap = p: (pkgs.writeShellScriptBin
            p
            (readFile (./. + "/${p}.bash")));
        in
        (nixpkgs.lib.genAttrs scripts scriptsMap));
    };
}
