{

  inputs.packument.url   = "https://registry.npmjs.org/string.prototype.trim?rev=17-2eee2d1271625f5de30e0d3894943c11";
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
    ident = "string.prototype.trim";
    ldir  = "info/unscoped/s/string.prototype.trim";
    inherit packument fetchInfo;
  } // latest';

}
