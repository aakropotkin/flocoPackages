{

  inputs.packument.url   = "https://registry.npmjs.org/history?rev=230-76f91411767c511d863dda04a025cf6d";
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
    ident = "history";
    ldir  = "info/unscoped/h/history";
    inherit packument fetchInfo;
  } // latest';

}
