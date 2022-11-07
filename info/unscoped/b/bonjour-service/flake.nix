{

  inputs.packument.url   = "https://registry.npmjs.org/bonjour-service?rev=18-9fd6a2ebd2428108ad37f6b55fdc50d6";
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
    ident = "bonjour-service";
    ldir  = "info/unscoped/b/bonjour-service";
    inherit packument fetchInfo;
  } // latest';

}
