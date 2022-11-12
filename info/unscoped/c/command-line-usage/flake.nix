{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/command-line-usage?_rev=56-6fff87abb3359ffb6118817769f19906";
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
    ident = "command-line-usage";
    ldir  = "info/unscoped/c/command-line-usage";
    inherit packument fetchInfo;
  } // latest';

}
