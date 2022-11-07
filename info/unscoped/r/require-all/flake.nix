{

  inputs.packument.url   = "https://registry.npmjs.org/require-all?rev=56-ac5c842dfe5ae45badd26fe38d9edba2";
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
    ident = "require-all";
    ldir  = "info/unscoped/r/require-all";
    inherit packument fetchInfo;
  } // latest';

}
