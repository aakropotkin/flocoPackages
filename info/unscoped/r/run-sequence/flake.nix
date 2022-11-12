{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/run-sequence?_rev=272-021a4a48da199ffc8a25c75325a5ed73";
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
    ident = "run-sequence";
    ldir  = "info/unscoped/r/run-sequence";
    inherit packument fetchInfo;
  } // latest';

}
