{

  inputs.packument.url   = "https://registry.npmjs.org/@types/once?rev=474-61fc2559208a9b73dc0f93bda1a0207d";
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
    scope = "@types";
    ident = "@types/once";
    ldir  = "info/types/once";
    inherit packument fetchInfo;
  } // latest';

}
