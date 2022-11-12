{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/proc-log?_rev=18-bf0b8c8f687e80c1395aeb83e1cef351";
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
    ident = "proc-log";
    ldir  = "info/unscoped/p/proc-log";
    inherit packument fetchInfo;
  } // latest';

}
