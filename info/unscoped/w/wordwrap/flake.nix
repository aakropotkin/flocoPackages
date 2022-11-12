{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/wordwrap?_rev=26-3d353fe05b0820814d373f2576ae40d2";
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
    ident = "wordwrap";
    ldir  = "info/unscoped/w/wordwrap";
    inherit packument fetchInfo;
  } // latest';

}
