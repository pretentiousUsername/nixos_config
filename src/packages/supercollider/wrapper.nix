{
  symlinkJoin,
  makeWrapper,
  supercollider,
  plugins,
}:
let
    localSc = ( callPackage ./default.nix { } );
in
symlinkJoin {
  name = "supercollider-with-plugins-${localSc.version}";
  paths = [ localSc ] ++ plugins;

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    for exe in $out/bin/*; do
      wrapProgram $exe \
        --set SC_PLUGIN_DIR "$out/lib/SuperCollider/plugins" \
        --set SC_DATA_DIR   "$out/share/SuperCollider"
    done
  '';

  inherit (localSc) pname version meta;
}
