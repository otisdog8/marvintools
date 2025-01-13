{
  inputs = { utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ uv python313 ];
          shellHook = ''
            export UV_PYTHON=${pkgs.python312}
            uv venv
          '';
        };
      });
}
