{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/string.prototype.trim?_rev=18-55b2c998551d0fb2c71bff537de262a2";
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
