{

  inputs.packument.url   = "https://registry.npmjs.org/mkdirp?rev=518-d0a20d69da0329be9aceb467c82bc44e";
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
    ident = "mkdirp";
    ldir  = "info/unscoped/m/mkdirp";
    inherit packument fetchInfo;
  } // latest';

}
