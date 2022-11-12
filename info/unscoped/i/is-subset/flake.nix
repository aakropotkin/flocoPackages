{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-subset?_rev=5-5e8cc5fccb7942d87ab8dabe248ebf56";
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
    ident = "is-subset";
    ldir  = "info/unscoped/i/is-subset";
    inherit packument fetchInfo;
  } // latest';

}
