{

  inputs.packument.url   = "https://registry.npmjs.org/react-redux?rev=348-355a0c2bbfd94f54542eba72d1e13066";
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
    ident = "react-redux";
    ldir  = "info/unscoped/r/react-redux";
    inherit packument fetchInfo;
  } // latest';

}
