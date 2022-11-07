{

  inputs.packument.url   = "https://registry.npmjs.org/react-error-overlay?rev=136-33fdc6044dd0c6eefcdcdb721c573982";
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
    ident = "react-error-overlay";
    ldir  = "info/unscoped/r/react-error-overlay";
    inherit packument fetchInfo;
  } // latest';

}
