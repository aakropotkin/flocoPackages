{

  inputs.packument.url   = "https://registry.npmjs.org/silent-error?rev=7-c8d92c85a9dc24b659ff873c69dc2133";
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
    ident = "silent-error";
    ldir  = "info/unscoped/s/silent-error";
    inherit packument fetchInfo;
  } // latest';

}
