{

  inputs.packument.url   = "https://registry.npmjs.org/react-reconciler?rev=1176-56a37f3b7f93ffc5f7ec9e311b5d44cb";
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
    ident = "react-reconciler";
    ldir  = "info/unscoped/r/react-reconciler";
    inherit packument fetchInfo;
  } // latest';

}
