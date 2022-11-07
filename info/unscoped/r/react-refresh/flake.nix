{

  inputs.packument.url   = "https://registry.npmjs.org/react-refresh?rev=1081-f2b552b9a885c50db682a3922c169ac0";
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
    ident = "react-refresh";
    ldir  = "info/unscoped/r/react-refresh";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
