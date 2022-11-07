{

  inputs.packument.url   = "https://registry.npmjs.org/chownr?rev=19-bec9fdc2d33d1eb4db86aeef81c995e8";
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
    ident = "chownr";
    ldir  = "info/unscoped/c/chownr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
