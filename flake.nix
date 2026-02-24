{
  description = "Java development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          jdk21
          maven
          gradle
        ];

        shellHook = ''
          export JAVA_HOME=${pkgs.jdk21}
          export PATH=$JAVA_HOME/bin:$PATH
          echo "Java dev environment ready 🚀"
          java -version
        '';
      };
    };
}
