{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/use?_rev=36-fb48e6b4fa0fec5364ee9d9f24afb9e7";
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
    ident = "use";
    ldir  = "info/unscoped/u/use";
    inherit packument fetchInfo;
  } // latest';

}
