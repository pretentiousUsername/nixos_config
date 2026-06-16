{
  symlinkJoin,
  makeWrapper,
  callPackage,
  sc ? (callPackage ./default.nix { }),
  plugins ? [ (callPackage ./sc3-plugins.nix) ],
}:

symlinkJoin {
  name = "supercollider-with-plugins-${sc.version}";
  paths = [ sc ] ++ plugins;

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    for exe in $out/bin/*; do
      wrapProgram $exe \
        --set SC_PLUGIN_DIR "$out/lib/SuperCollider/plugins" \
        --set SC_DATA_DIR   "$out/share/SuperCollider"
    done
  '';

  inherit (sc) pname version meta;
}
