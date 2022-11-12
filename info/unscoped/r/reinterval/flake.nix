{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/reinterval?_rev=8-89a028a111caa02f2d3183ae1b372c9f";
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
    ident = "reinterval";
    ldir  = "info/unscoped/r/reinterval";
    inherit packument fetchInfo;
  } // latest';

}
