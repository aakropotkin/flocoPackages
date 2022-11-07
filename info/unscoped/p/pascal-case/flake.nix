{

  inputs.packument.url   = "https://registry.npmjs.org/pascal-case?rev=29-04606fe3dfa41db83ff1509eb41449e0";
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
    ident = "pascal-case";
    ldir  = "info/unscoped/p/pascal-case";
    inherit packument fetchInfo;
  } // latest';

}
