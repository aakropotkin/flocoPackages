{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-callable?_rev=31-93e038d40f8a615bc45b1154dcad661e";
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
    ident = "is-callable";
    ldir  = "info/unscoped/i/is-callable";
    inherit packument fetchInfo;
  } // latest';

}
