{

  inputs.packument.url   = "https://registry.npmjs.org/decompress-tarbz2?rev=24-a1039ec4a54dbb4b240287b221727529";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "decompress-tarbz2";
    ldir  = "info/unscoped/d/decompress-tarbz2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
