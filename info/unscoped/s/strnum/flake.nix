{

  inputs.packument.url   = "https://registry.npmjs.org/strnum?rev=7-99f5243df6a3559e89f2d750243a2bb8";
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
    ident = "strnum";
    ldir  = "info/unscoped/s/strnum";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
