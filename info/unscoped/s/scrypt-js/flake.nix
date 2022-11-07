{

  inputs.packument.url   = "https://registry.npmjs.org/scrypt-js?rev=13-e1a0e6e4c9eb534676b1f7f93b745904";
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
    ident = "scrypt-js";
    ldir  = "info/unscoped/s/scrypt-js";
    inherit packument fetchInfo;
  } // latest';

}
