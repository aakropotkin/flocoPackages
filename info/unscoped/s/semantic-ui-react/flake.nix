{

  inputs.packument.url   = "https://registry.npmjs.org/semantic-ui-react?rev=205-0a67456407d57015f9522f19b158b47d";
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
    ident = "semantic-ui-react";
    ldir  = "info/unscoped/s/semantic-ui-react";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
