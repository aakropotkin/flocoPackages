{

  inputs.packument.url   = "https://registry.npmjs.org/should-format?rev=27-74fd87e44c409699a8f6845ccb415f86";
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
    ident = "should-format";
    ldir  = "info/unscoped/s/should-format";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
