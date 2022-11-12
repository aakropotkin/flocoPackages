{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/needle?_rev=252-437a5b481304b3f6b94d45d082531e03";
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
    ident = "needle";
    ldir  = "info/unscoped/n/needle";
    inherit packument fetchInfo;
  } // latest';

}
