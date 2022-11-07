{

  inputs.packument.url   = "https://registry.npmjs.org/bson?rev=446-d77c937e30713988ea88c5866ae2bb2c";
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
    ident = "bson";
    ldir  = "info/unscoped/b/bson";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
