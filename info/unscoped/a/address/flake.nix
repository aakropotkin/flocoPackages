{

  inputs.packument.url   = "https://registry.npmjs.org/address?rev=32-8aeff48e5b0d6ad22a75259ab44997b5";
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
    ident = "address";
    ldir  = "info/unscoped/a/address";
    inherit packument fetchInfo;
  } // latest';

}
