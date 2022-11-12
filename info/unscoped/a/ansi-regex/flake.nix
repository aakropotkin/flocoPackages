{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ansi-regex?_rev=56-0d93cfc815d10b9e54c4d2b298a530c0";
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
    ident = "ansi-regex";
    ldir  = "info/unscoped/a/ansi-regex";
    inherit packument fetchInfo;
  } // latest';

}
