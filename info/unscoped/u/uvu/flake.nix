{

  inputs.packument.url   = "https://registry.npmjs.org/uvu?rev=50-f35f6e6f05f8460bf39c3133dc3d5b00";
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
    ident = "uvu";
    ldir  = "info/unscoped/u/uvu";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
