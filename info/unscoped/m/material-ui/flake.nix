{

  inputs.packument.url   = "https://registry.npmjs.org/material-ui?rev=413-46b075530ede93ec5d9b3613cef6aef9";
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
    ident = "material-ui";
    ldir  = "info/unscoped/m/material-ui";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
