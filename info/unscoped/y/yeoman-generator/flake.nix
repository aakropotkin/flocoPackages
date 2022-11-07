{

  inputs.packument.url   = "https://registry.npmjs.org/yeoman-generator?rev=300-90fa2bf0afb76ef9b7887f650d250b0d";
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
    ident = "yeoman-generator";
    ldir  = "info/unscoped/y/yeoman-generator";
    inherit packument fetchInfo;
  } // latest';

}
