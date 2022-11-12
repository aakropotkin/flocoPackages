{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/class-utils?_rev=18-0bb4f8ff90cef84a717f21689b626bb9";
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
    ident = "class-utils";
    ldir  = "info/unscoped/c/class-utils";
    inherit packument fetchInfo;
  } // latest';

}
