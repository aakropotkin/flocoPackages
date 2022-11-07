{

  inputs.packument.url   = "https://registry.npmjs.org/he?rev=103-08018dcbe2acd2669d57503c9b56af5b";
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
    ident = "he";
    ldir  = "info/unscoped/h/he";
    inherit packument fetchInfo;
  } // latest';

}
