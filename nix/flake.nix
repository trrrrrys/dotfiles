{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages.cli-tools = pkgs.buildEnv {
          name = "cli-tools";
          paths = with pkgs; [
            git
            gh
            ghq
            tmux
            jq
            yq
            vim
            coreutils
            findutils
            gawk
            gnused
            gnutar
            wget
            awscli2
            docker
            docker-compose
            buf
            grpcurl
            plantuml
            lcov
            tig
            openssl
          ];
        };
      }
    );
}
