{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/url-parse?_rev=128-260945f3d7907c89374c54be366401ca";
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
    ident = "url-parse";
    ldir  = "info/unscoped/u/url-parse";
    inherit packument fetchInfo;
  } // latest';

}
