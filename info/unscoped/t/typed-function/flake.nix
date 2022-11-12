{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/typed-function?_rev=44-487c1dea333a4bd80937d646ee92b927";
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
    ident = "typed-function";
    ldir  = "info/unscoped/t/typed-function";
    inherit packument fetchInfo;
  } // latest';

}
