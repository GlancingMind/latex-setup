{ stdenvNoCC, texlive }:

let
  tex = texlive.combine {
    inherit (texlive)
      latex-bin # contains lualatex which is required by latexmk
      latexmk
      scheme-minimal;
  };
in stdenvNoCC.mkDerivation {
  name = "project-phase-report";
  src = ./.;

  nativeBuildInputs = [ tex ];

  TEXMFVAR = ".cache/texmf-var";

  installPhase = ''
    mkdir -p $out
    cp *.pdf $out
  '';
}
