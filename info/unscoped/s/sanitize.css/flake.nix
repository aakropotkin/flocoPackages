{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sanitize.css?_rev=50-887554e0a40a1b0b193d0cdc77c8cab1";
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
    ident = "sanitize.css";
    ldir  = "info/unscoped/s/sanitize.css";
    inherit packument fetchInfo;
  } // latest';

}
