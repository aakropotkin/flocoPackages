{

  inputs.packument.url   = "https://registry.npmjs.org/mobx-react-lite?rev=72-11dccb1a9b0eaab283b62c0319433a63";
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
    ident = "mobx-react-lite";
    ldir  = "info/unscoped/m/mobx-react-lite";
    inherit packument fetchInfo;
  } // latest';

}
